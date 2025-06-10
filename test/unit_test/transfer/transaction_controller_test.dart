import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:gopay_task/controllers/transaction_controller.dart';
import 'package:gopay_task/controllers/gopaysaldo_controller.dart';
import 'package:gopay_task/controllers/historytransaction_controller.dart';
import 'package:gopay_task/models/transaction_model.dart';

@GenerateNiceMocks([
  MockSpec<GopaySaldoController>(),
  MockSpec<HistoryTransactionController>(),
])
import 'transaction_controller_test.mocks.dart';

void main() {

  TestWidgetsFlutterBinding.ensureInitialized();

  late TransactionController controller;
  late MockGopaySaldoController mockSaldoController;
  late MockHistoryTransactionController mockHistoryController;

  setUp(() {
    Get.reset();
    
    mockSaldoController = MockGopaySaldoController();
    mockHistoryController = MockHistoryTransactionController();
    
    when(mockSaldoController.onInit()).thenAnswer((_) {});
    when(mockSaldoController.onReady()).thenAnswer((_) {});
    when(mockHistoryController.onInit()).thenAnswer((_) {});
    when(mockHistoryController.onReady()).thenAnswer((_) {});

    Get.lazyPut<GopaySaldoController>(() => mockSaldoController);
    Get.lazyPut<HistoryTransactionController>(() => mockHistoryController);
    
    controller = Get.put(TransactionController());
  });

  group('TransactionController Initialization', () {
    test('should initialize with default payment method (ShopeePay)', () {
      expect(controller.selectedPaymentMethod, isNotNull);
      expect(controller.selectedPaymentMethod!.id, equals(2));
      expect(controller.selectedPaymentMethod!.name, equals('ShopeePay'));
    });

    test('should have 3 available payment methods', () {
      expect(controller.availablePaymentMethods.length, equals(3));
      expect(controller.availablePaymentMethods[0].name, equals('GoPay'));
      expect(controller.availablePaymentMethods[1].name, equals('ShopeePay'));
      expect(controller.availablePaymentMethods[2].name, equals('BLU By BCA Digital'));
    });

    test('should initialize with empty nominal and hidden confirmation', () {
      expect(controller.formattedNominal, equals('Rp'));
      expect(controller.rawNominal, equals(''));
      expect(controller.showConfirmation, isFalse);
      expect(controller.isProcessingTransfer, isFalse);
    });
  });

  group('Payment Method Management', () {
    test('should set payment method when enabled', () {
      final bluMethod = controller.availablePaymentMethods.firstWhere((m) => m.id == 3);
      
      controller.setPaymentMethod(bluMethod);
      
      expect(controller.selectedPaymentMethod!.id, equals(3));
      expect(controller.selectedPaymentMethod!.name, equals('BLU By BCA Digital'));
    });

    test('should not set payment method when disabled', () {
      final gopayMethod = controller.availablePaymentMethods.firstWhere((m) => m.id == 1);
      final initialMethod = controller.selectedPaymentMethod;
      
      controller.setPaymentMethod(gopayMethod);
      
      expect(controller.selectedPaymentMethod, equals(initialMethod));
    });

    test('should set payment method by ID', () {
      controller.setPaymentMethodById(3);
      
      expect(controller.selectedPaymentMethod!.id, equals(3));
      expect(controller.selectedPaymentMethod!.name, equals('BLU By BCA Digital'));
    });

    test('should set payment method from transfer page name - ShopeePay', () {
      controller.setPaymentMethodFromTransferPage('ShopeePay Transfer');
      
      expect(controller.selectedPaymentMethod!.id, equals(2));
      expect(controller.selectedPaymentMethod!.name, equals('ShopeePay'));
    });

    test('should set payment method from transfer page name - BLU', () {
      controller.setPaymentMethodFromTransferPage('BLU Digital Transfer');
      
      expect(controller.selectedPaymentMethod!.id, equals(3));
      expect(controller.selectedPaymentMethod!.name, equals('BLU By BCA Digital'));
    });
  });

  group('Nominal Management', () {
    test('should add number to nominal', () {
      controller.addNumber('1');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      
      expect(controller.rawNominal, equals('1000'));
      expect(controller.formattedNominal, equals('Rp1.000'));
    });

    test('should not add leading zero', () {
      controller.addNumber('0');
      
      expect(controller.rawNominal, equals(''));
    });

    test('should not exceed max amount', () {
      controller.addNumber('2');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('1'); 
      
      expect(controller.rawNominal, equals('20000000'));
      expect(controller.nominalAsInt, equals(20000000));
    });

    test('should remove last character', () {
      controller.addNumber('1');
      controller.addNumber('2');
      controller.addNumber('3');
      
      controller.removeLastCharacter();
      
      expect(controller.rawNominal, equals('12'));
    });

    test('should clear nominal', () {
      controller.addNumber('1');
      controller.addNumber('0');
      controller.addNumber('0');
      
      controller.clearNominal();
      
      expect(controller.rawNominal, equals(''));
      expect(controller.formattedNominal, equals('Rp'));
    });

    test('should format nominal correctly', () {
      controller.addNumber('1');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      
      expect(controller.formattedNominal, equals('Rp100.000'));
    });
  });

  group('Validation', () {
  test('should validate amount correctly and handle max amount limit', () {
    controller.addNumber('10000');
    expect(controller.isValidAmount, isTrue,
        reason: "Nominal positif seharusnya valid.");

    controller.clearNominal();
    expect(controller.isValidAmount, isFalse,
        reason: "Nominal nol seharusnya tidak valid.");

    controller.clearNominal();
    String largeAmountString = (TransactionController.maxAmount + 1000).toString();
    for (final char in largeAmountString.runes) {
      controller.addNumber(String.fromCharCode(char));
    }

    expect(controller.rawNominal, TransactionController.maxAmount.toString());
    
    expect(controller.isValidAmount, isTrue,
        reason: "Nominal yang sudah dibatasi di angka maksimum seharusnya tetap valid.");
  });

  test('should check review button active state', () {
    expect(controller.isReviewButtonActive, isFalse);
    
    controller.addNumber('10000');

    expect(controller.isReviewButtonActive, isTrue);
  });

  test('should check sufficient saldo by calling mock', () {
    when(mockSaldoController.hasSufficientSaldo(10000)).thenReturn(true);
    
    controller.addNumber('10000');
    
    expect(controller.hasSufficientSaldo, isTrue);
    
    verify(mockSaldoController.hasSufficientSaldo(10000)).called(1);
  });
});

  group('Transfer Confirmation', () {
    test('should show transfer confirmation', () {
      controller.showTransferConfirmation();
      
      expect(controller.showConfirmation, isTrue);
    });

    test('should hide transfer confirmation', () {
      controller.showTransferConfirmation();
      controller.hideTransferConfirmation();
      
      expect(controller.showConfirmation, isFalse);
    });
  });

  group('Execute Transfer', () {
    setUp(() {
      controller.addNumber('1');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
    });

    test('should execute transfer successfully', () async {
      when(mockSaldoController.hasSufficientSaldo(any)).thenReturn(true);
      when(mockSaldoController.deductSaldo(any)).thenAnswer((_) async => true);
      when(mockHistoryController.addTransaction(
        any, any, any,
        secondaryDescription: anyNamed('secondaryDescription'),
        paymentMethod: anyNamed('paymentMethod'),
        transactionDate: anyNamed('transactionDate'),
      )).thenAnswer((_) async {});
      
      final result = await controller.executeTransfer();
      
      expect(result, isTrue);
      expect(controller.rawNominal, equals(''));
      expect(controller.showConfirmation, isFalse);
      expect(controller.isProcessingTransfer, isFalse);
      
      verify(mockSaldoController.deductSaldo(10000)).called(1);
      verify(mockHistoryController.addTransaction(
        TransactionType.transferKeluar,
        -10000.0,
        'Ditransfer ke Bxxxxxxxxx4',
        secondaryDescription: 'ShopeePay +6281217936746',
        paymentMethod: 'GoPay Saldo',
        transactionDate: anyNamed('transactionDate'),
      )).called(1);
    });

    test('should fail transfer when insufficient saldo', () async {
      when(mockSaldoController.hasSufficientSaldo(any)).thenReturn(false);
      
      final result = await controller.executeTransfer();
      
      expect(result, isFalse);
      expect(controller.isProcessingTransfer, isFalse);
      
      verifyNever(mockSaldoController.deductSaldo(any));
      verifyNever(mockHistoryController.addTransaction(any, any, any));
    });

    test('should fail transfer when invalid amount', () async {
      controller.clearNominal();
      
      final result = await controller.executeTransfer();
      
      expect(result, isFalse);
      
      verifyNever(mockSaldoController.hasSufficientSaldo(any));
      verifyNever(mockSaldoController.deductSaldo(any));
    });

    test('should not execute transfer when already processing', () async {
      when(mockSaldoController.hasSufficientSaldo(any)).thenReturn(true);
      when(mockSaldoController.deductSaldo(any)).thenAnswer((_) async {
        await Future.delayed(Duration(milliseconds: 100));
        return true;
      });
      when(mockHistoryController.addTransaction(
        any, any, any,
        secondaryDescription: anyNamed('secondaryDescription'),
        paymentMethod: anyNamed('paymentMethod'),
        transactionDate: anyNamed('transactionDate'),
      )).thenAnswer((_) async {});
      
      final future1 = controller.executeTransfer();
      
      final result2 = await controller.executeTransfer();
      
      expect(result2, isFalse);
      
      final result1 = await future1;
      expect(result1, isTrue);
    });

    test('should handle saldo deduction failure', () async {
      when(mockSaldoController.hasSufficientSaldo(any)).thenReturn(true);
      when(mockSaldoController.deductSaldo(any)).thenAnswer((_) async => false);
      
      final result = await controller.executeTransfer();
      
      expect(result, isFalse);
      expect(controller.isProcessingTransfer, isFalse);
      
      verify(mockSaldoController.deductSaldo(10000)).called(1);
      verifyNever(mockHistoryController.addTransaction(any, any, any));
    });

    test('should handle exception during transfer', () async {
      when(mockSaldoController.hasSufficientSaldo(any)).thenReturn(true);
      when(mockSaldoController.deductSaldo(any)).thenThrow(Exception('Network error'));
      
      final result = await controller.executeTransfer();
      
      expect(result, isFalse);
      expect(controller.isProcessingTransfer, isFalse);
    });
  });

  group('Processing State', () {
    test('should track processing state during transfer', () async {
      controller.addNumber('1');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      controller.addNumber('0');
      
      when(mockSaldoController.hasSufficientSaldo(any)).thenReturn(true);
      when(mockSaldoController.deductSaldo(any)).thenAnswer((_) async {
        await Future.delayed(Duration(milliseconds: 50));
        return true;
      });
      when(mockHistoryController.addTransaction(
        any, any, any,
        secondaryDescription: anyNamed('secondaryDescription'),
        paymentMethod: anyNamed('paymentMethod'),
        transactionDate: anyNamed('transactionDate'),
      )).thenAnswer((_) async {});
      
      expect(controller.isProcessingTransfer, isFalse);
      
      final transferFuture = controller.executeTransfer();
      
      await Future.delayed(Duration(milliseconds: 10));
      expect(controller.isProcessingTransfer, isTrue);
      
      await transferFuture;
      expect(controller.isProcessingTransfer, isFalse);
    });
  });
    test('should create PaymentMethod with required fields', () {
      final method = PaymentMethod(
        id: 1,
        name: 'Test Payment',
        iconPath: 'assets/test.png',
        accountNumber: '123456',
        accountName: 'Test Account',
      );
      
      expect(method.id, equals(1));
      expect(method.name, equals('Test Payment'));
      expect(method.iconPath, equals('assets/test.png'));
      expect(method.accountNumber, equals('123456'));
      expect(method.accountName, equals('Test Account'));
      expect(method.isEnabled, isTrue); 
    });

    test('should create PaymentMethod with custom isEnabled', () {
      final method = PaymentMethod(
        id: 1,
        name: 'Test Payment',
        iconPath: 'assets/test.png',
        accountNumber: '123456',
        accountName: 'Test Account',
        isEnabled: false,
      );
      
      expect(method.isEnabled, isFalse);
    });
  }