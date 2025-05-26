import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GopaySaldoController extends GetxController {
  static const String _saldoKey = 'gopay_saldo';
  
  final RxDouble _saldo = 0.0.obs;
  
  // Getter untuk saldo
  double get saldo => _saldo.value;
  
  // Format saldo sebagai string dengan format Rupiah
  String get formattedSaldo{
    return 'Rp${_saldo.value.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    )}';
  }
  
  @override
  void onInit() {
    super.onInit();
    loadSaldo();
  }
  
  // Load balance dari SharedPreferences
  Future<void> loadSaldo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      double savedSaldo = prefs.getDouble(_saldoKey) ?? 100000.0; // Default 100k
      _saldo.value = savedSaldo;
      print('Balance loaded: ${_saldo.value}');
    } catch (e) {
      print('Error loading balance: $e');
      _saldo.value = 100000.0; // Fallback ke default
    }
  }
  
  // Save saldo ke SharedPreferences
  Future<void> _saveSaldo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_saldoKey, _saldo.value);
      print('Saldo saved: ${_saldo.value}');
    } catch (e) {
      print('Error saving saldo: $e');
    }
  }
  
  // Add saldo (untuk top up)
  Future<bool> addSaldo(double amount) async {
    if (amount <= 0) return false;
    
    try {
      _saldo.value += amount;
      await _saveSaldo();
      print('Saldo added: $amount, New saldo: ${_saldo.value}');
      return true;
    } catch (e) {
      print('Error adding saldo: $e');
      return false;
    }
  }
  
  // Deduct saldo (untuk transfer/pembayaran)
  Future<bool> deductSaldo(double amount) async {
    if (amount <= 0) return false;
    if (_saldo.value < amount) {
      print('Insufficient balance. Current: ${_saldo.value}, Required: $amount');
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
  
  // Check if saldo is sufficient
  bool hasSufficientSaldo(double amount) {
    return _saldo.value >= amount;
  }
  
  // Set saldo manually (untuk testing/development)
  Future<void> setSaldo(double amount) async {
    if (amount < 0) return;
    
    _saldo.value = amount;
    await _saveSaldo();
    print('Saldo set to: ${_saldo.value}');
  }
  
  // Reset saldo
  Future<void> resetSaldo() async {
    _saldo.value = 100000.0;
    await _saveSaldo();
    print('Saldo reset to 0');
  }
}