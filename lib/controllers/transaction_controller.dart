// Transaction_controller.dart - Updated version
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gopay_task/controllers/gopaysaldo_controller.dart';
import 'package:gopay_task/controllers/historytransaction_controller.dart';
import 'package:gopay_task/models/transaction_model.dart'; // Tambahkan import
import 'package:intl/intl.dart';

// Model untuk Payment Method
class PaymentMethod {
  final int id;
  final String name;
  final String iconPath;
  final String accountNumber;
  final String accountName;
  final bool isEnabled;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.accountNumber,
    required this.accountName,
    this.isEnabled = true,
  });
}

class TransactionController extends GetxController {
  RxString _nominalString = ''.obs;
  Rx<PaymentMethod?> _selectedPaymentMethod = Rx<PaymentMethod?>(null);
  RxBool _showConfirmation = false.obs;
  RxBool _isProcessingTransfer = false.obs;

  static const int maxAmount = 20000000;

  GopaySaldoController get saldoController => Get.find<GopaySaldoController>();
  
  // Tambahkan getter untuk HistoryTransactionController
  HistoryTransactionController get historyController => Get.find<HistoryTransactionController>();

  final List<PaymentMethod> availablePaymentMethods = [
    PaymentMethod(
      id: 1,
      name: 'GoPay',
      iconPath: 'assets/circleicon_gopay.png',
      accountNumber: '',
      accountName: 'Kamu juga bisa top up saldo',
      isEnabled: false,
    ),
    PaymentMethod(
      id: 2,
      name: 'ShopeePay',
      iconPath: 'assets/circleicon_shopeepay.png',
      accountNumber: '+6281217936746',
      accountName: 'Bxxxxxxxxx4',
      isEnabled: true,
    ),
    PaymentMethod(
      id: 3,
      name: 'BLU By BCA Digital',
      iconPath: 'assets/circletopup_blu.png',
      accountNumber: '006865633699',
      accountName: 'Bhagas Satrya Dewa',
      isEnabled: true,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    // Set default payment method ke ShopeePay
    _selectedPaymentMethod.value = availablePaymentMethods.firstWhere((method) => method.id == 2);
  }

  // Getter untuk selected payment method
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod.value;

  // Getter untuk show confirmation state
  bool get showConfirmation => _showConfirmation.value;

  // Getter untuk processing state
  bool get isProcessingTransfer => _isProcessingTransfer.value;

  // Method untuk toggle confirmation view
  void showTransferConfirmation() {
    _showConfirmation.value = true;
  }

  void hideTransferConfirmation() {
    _showConfirmation.value = false;
  }

  // Method untuk set payment method dari parameter atau dari bottomsheet
  void setPaymentMethod(PaymentMethod method) {
    if (method.isEnabled) {
      _selectedPaymentMethod.value = method;
    }
  }

  // Method untuk set payment method berdasarkan ID
  void setPaymentMethodById(int id) {
    final method = availablePaymentMethods.firstWhere(
      (method) => method.id == id,
      orElse: () => availablePaymentMethods.first,
    );
    setPaymentMethod(method);
  }

  // Method untuk set payment method dari transfer page (ShopeePay atau BLU)
  void setPaymentMethodFromTransferPage(String methodName) {
    PaymentMethod? method;
    if (methodName.toLowerCase().contains('shopee')) {
      method = availablePaymentMethods.firstWhere((m) => m.id == 2);
    } else if (methodName.toLowerCase().contains('blu')) {
      method = availablePaymentMethods.firstWhere((m) => m.id == 3);
    }
    if (method != null) {
      setPaymentMethod(method);
    }
  }

  String get formattedNominal {
    if (_nominalString.value.isEmpty) {
      return 'Rp';
    }
    int nominal = int.tryParse(_nominalString.value) ?? 0;
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return formatter.format(nominal);
  }

  String get rawNominal => _nominalString.value;

  bool get isReviewButtonActive {
    if (_nominalString.value.isEmpty) return false;
    int nominal = int.tryParse(_nominalString.value) ?? 0;
    return nominal > 0 && nominal <= maxAmount && !_isProcessingTransfer.value;
  }

  void addNumber(String number) {
    if (_nominalString.value.isEmpty && number == "0") {
      return;
    }
    String newValue = _nominalString.value + number;
    int nominal = int.tryParse(newValue) ?? 0;
    if (nominal <= maxAmount) {
      _nominalString.value = newValue;
    }
  }

  void removeLastCharacter() {
    if (_nominalString.value.isNotEmpty) {
      _nominalString.value = _nominalString.value.substring(0, _nominalString.value.length - 1);
    }
  }

  void clearNominal() {
    _nominalString.value = '';
  }

  int get nominalAsInt {
    return int.tryParse(_nominalString.value) ?? 0;
  }

  bool get isValidAmount {
    int nominal = nominalAsInt;
    return nominal > 0 && nominal <= maxAmount;
  }

  // Check if user has sufficient GoPay saldo
  bool get hasSufficientSaldo {
    return saldoController.hasSufficientSaldo(nominalAsInt.toDouble());
  }

  // Method untuk melakukan transfer (mengurangi saldo GoPay) - Updated
  Future<bool> executeTransfer() async {
    if (!isValidAmount || _isProcessingTransfer.value) {
      return false;
    }

    // Check if user has sufficient saldo
    if (!hasSufficientSaldo) {
      Get.snackbar(
        'Saldo Tidak Cukup',
        'Saldo GoPay Anda tidak mencukupi untuk melakukan transfer ini',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
      );
      return false;
    }

    _isProcessingTransfer.value = true;

    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));

      // Deduct saldo
      bool success = await saldoController.deductSaldo(nominalAsInt.toDouble());

      if (success) {
        // Tambahkan transaksi ke history setelah transfer berhasil
        await _addTransferToHistory();

        Get.snackbar(
          'Transfer Berhasil',
          'Transfer sebesar ${formattedNominal} berhasil dilakukan',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green[100],
          colorText: Colors.green[800],
        );

        // Reset form
        clearNominal();
        hideTransferConfirmation();

        // Navigate back or to success page
        Get.back();
        return true;
      } else {
        Get.snackbar(
          'Transfer Gagal',
          'Terjadi kesalahan saat memproses transfer',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[100],
          colorText: Colors.red[800],
        );
        return false;
      }
    } catch (e) {
      print('Error executing transfer: $e');
      Get.snackbar(
        'Transfer Gagal',
        'Terjadi kesalahan saat memproses transfer',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[100],
        colorText: Colors.red[800],
      );
      return false;
    } finally {
      _isProcessingTransfer.value = false;
    }
  }

  // Method baru untuk menambahkan transaksi transfer ke history
  Future<void> _addTransferToHistory() async {
    try {
      final selectedMethod = _selectedPaymentMethod.value;
      if (selectedMethod == null) return;

      // Buat deskripsi berdasarkan payment method yang dipilih
      String description = 'Ditransfer ke ${selectedMethod.accountName}';
      String? secondaryDescription;

      if (selectedMethod.accountNumber.isNotEmpty) {
        secondaryDescription = '${selectedMethod.name} ${selectedMethod.accountNumber}';
      }

      // Tambahkan transaksi ke history dengan amount negatif (keluar)
      await historyController.addTransaction(
        TransactionType.transferKeluar,
        -nominalAsInt.toDouble(), // Negatif karena ini transfer keluar
        description,
        secondaryDescription: secondaryDescription,
        paymentMethod: 'GoPay Saldo', // Transfer menggunakan GoPay
        transactionDate: DateTime.now(),
      );

      print('Transfer transaction added to history successfully');
    } catch (e) {
      print('Error adding transfer to history: $e');
    }
  }
}