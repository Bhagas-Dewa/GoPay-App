import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GopaySaldoController extends GetxController {
  static const String _saldoKey = 'gopay_saldo';

  final RxInt _saldo = 0.obs;

  int get saldo => _saldo.value;

  String get formattedSaldo {
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return formatCurrency.format(_saldo.value);
  }

  @override
  void onInit() {
    super.onInit();
    loadSaldo();
  }

  Future<void> loadSaldo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _saldo.value = prefs.getInt(_saldoKey) ?? 500000;
    } catch (e) {
      _saldo.value = 500000;
      print('Error loading balance: $e');
    }
  }

  Future<void> _saveSaldo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_saldoKey, _saldo.value);
    } catch (e) {
      print('Error saving saldo: $e');
    }
  }

  Future<void> addSaldo(int amount) async {
    if (amount <= 0) return;
    _saldo.value += amount;
    await _saveSaldo();
  }


  Future<bool> deductSaldo(int amount) async {
  if (amount <= 0) return false;
  if (_saldo.value < amount) {
    print('Insufficient balance.');
    return false;
  }

  try {
    _saldo.value -= amount;
    await _saveSaldo();
    print('Saldo deducted: $amount, New saldo: ${_saldo.value}');
    return true;
  } catch (e) {
    print('Error deducting saldo: $e');
    return false; 
  }
}

  bool hasSufficientSaldo(int amount) {
    return _saldo.value >= amount;
  }

// testing
  void setInitialBalance(int amount) {
    if (amount < 0) return;
    _saldo.value = amount;
  }
}