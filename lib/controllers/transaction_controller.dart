import 'package:get/get.dart';
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

  static const int maxAmount = 20000000;
  
  final List<PaymentMethod> availablePaymentMethods = [
    PaymentMethod(
      id: 1,
      name: 'GoPay',
      iconPath: 'assets/circleicon_gopay.png',
      accountNumber: '',
      accountName: 'Kamu juga bisa top up saldo',
      isEnabled: false, // tidak mengubah container
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
    return nominal > 0 && nominal <= maxAmount;
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
}