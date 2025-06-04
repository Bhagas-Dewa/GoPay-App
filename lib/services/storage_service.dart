// lib/services/storage_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  static const String _tokenKey = 'auth_token';
  static const String _userEmailKey = 'user_email'; // Contoh jika ingin simpan email

  Future<SharedPreferences> get _prefs async => SharedPreferences.getInstance();

  // Panggil ini di main.dart untuk inisialisasi
  Future<StorageService> init() async {
    // Bisa tambahkan logic inisialisasi lain jika perlu
    print('StorageService Initialized');
    return this;
  }

  Future<void> saveToken(String token) async {
    final prefs = await _prefs;
    await prefs.setString(_tokenKey, token);
    print('Token saved');
  }

  Future<String?> getToken() async {
    final prefs = await _prefs;
    final token = prefs.getString(_tokenKey);
    // print(token == null ? 'No token found' : 'Token retrieved');
    return token;
  }

  Future<void> deleteToken() async {
    final prefs = await _prefs;
    await prefs.remove(_tokenKey);
    print('Token deleted');
  }

  // Contoh tambahan: menyimpan email pengguna
  Future<void> saveUserEmail(String email) async {
    final prefs = await _prefs;
    await prefs.setString(_userEmailKey, email);
  }

  Future<String?> getUserEmail() async {
    final prefs = await _prefs;
    return prefs.getString(_userEmailKey);
  }

   Future<void> deleteUserEmail() async {
    final prefs = await _prefs;
    await prefs.remove(_userEmailKey);
  }
}