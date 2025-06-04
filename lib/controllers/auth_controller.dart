import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gopay_task/models/user_model.dart'; 
import 'package:gopay_task/services/auth_service.dart'; 
import 'package:gopay_task/services/storage_service.dart';
import 'package:gopay_task/views/home/home.dart';
import 'package:gopay_task/views/login/create_name_page.dart';
import 'package:gopay_task/views/login/create_pin_page.dart';
import 'package:gopay_task/views/login/otp_page.dart';
import 'package:gopay_task/views/login/pin_login_page.dart';
import 'package:gopay_task/views/login/start_page.dart';

class AuthController extends GetxController {
  // Dependencies
  final AuthService _authService = Get.find<AuthService>();
  final StorageService _storageService = Get.find<StorageService>();

  // Loading state
  final RxBool isLoading = false.obs;

  // User and Auth State
  final Rx<User?> authenticatedUser = Rx<User?>(null);
  final RxBool isAuthenticated = false.obs;
  String? _token; // Internal token storage

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController pinInputController = TextEditingController();
  final RxString pinForUIDisplay = ''.obs;

  // Email yang sedang dalam proses registrasi
  final RxString currentEmailForRegistration = ''.obs;

  // RxString confirmPin = ''.obs;
  RxBool isPinObscured = true.obs;
  // RxBool isConfirmPinObscured = true.obs; 
  RxBool isPinComplete = false.obs; 
  // RxBool isConfirmPinComplete = false.obs; 
  // RxBool isPinMatched = false.obs;
  static const int maxPinLength = 6;


  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
    pinInputController.addListener(() {
      pinForUIDisplay.value = pinInputController.text;

       updatePinState(pinInputController.text);
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    otpController.dispose();
    pinInputController.dispose();
    super.onClose();
  }

  // --- Core Auth Methods ---
  Future<void> _checkLoginStatus() async {
    _token = await _storageService.getToken();
    if (_token != null && _token!.isNotEmpty) {
      await fetchAuthenticatedUser(isInitialCheck: true);
    } else {
      isAuthenticated.value = false;
    }
  }

  Future<void> fetchAuthenticatedUser({bool isInitialCheck = false}) async {
    if (_token == null) {
      isAuthenticated.value = false;
      if (!isInitialCheck) Get.offAllNamed('/login_start'); // Ganti dengan nama route halaman awal loginmu
      return;
    }
    isLoading.value = true;
    try {
      final user = await _authService.getMe();
      if (user != null) {
        authenticatedUser.value = user;
        isAuthenticated.value = true;
        if (!isInitialCheck) Get.offAllNamed('/home'); // Ganti dengan nama route halaman utama aplikasi
      } else {
        // Jika getMe gagal (misal token expired), logout
        await logout();
      }
    } catch (e) {
      print("Error fetching user: $e");
      await logout();
    } finally {
      isLoading.value = false;
    }
  }

  // --- Login Flow ---
   Future<void> checkEmailLogin() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Email tidak boleh kosong', snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      return;
    }
    isLoading.value = true;
    try {
      final response = await _authService.checkEmailLogin(emailController.text);

      // DEBUGGING: Cetak respons dari AuthService
      if (response['status'] == 'registered') {
        currentEmailForRegistration.value = emailController.text; 
         Get.to(() => PinLoginPage()); 
      } else if (response['status'] == 'not_found') {
        Get.snackbar('Gagal', response['message'] ?? 'Email belum terdaftar.', snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.orange.withOpacity(0.8), colorText: Colors.white);
      } else {
        Get.snackbar('Error', response['message'] ?? 'Terjadi kesalahan.', snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak dapat terhubung ke server.', snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      print("checkEmailLogin error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loginWithPin() async {
    final email = currentEmailForRegistration.value;
    if (email.isEmpty || pinInputController.text.length != maxPinLength) {
      Get.snackbar('Error', 'Email atau PIN tidak valid.', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    isLoading.value = true;
    try {
      final response = await _authService.loginWithPin(email, pinInputController.text);
      if (response['status'] == 'success' && response['token'] != null) {
        _token = response['token'];
        authenticatedUser.value = User.fromJson(response['user'] as Map<String, dynamic>);
        isAuthenticated.value = true;
        pinInputController.clear();
        Get.offAll(()=> Home());
      } else {
        Get.snackbar('Login Gagal', response['message'] ?? 'Email atau PIN salah.', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak dapat terhubung ke server.', snackPosition: SnackPosition.BOTTOM);
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // --- Registration Flow ---
  Future<void> checkEmailRegister() async {
    if (emailController.text.isEmpty) {
      Get.snackbar('Error', 'Email tidak boleh kosong', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    isLoading.value = true;
    try {
      final response = await _authService.checkEmailRegister(emailController.text);
      if (response['status'] == 'otp_sent') {
        currentEmailForRegistration.value = emailController.text; 
        Get.to(()=> OtpPage());
        Get.snackbar('Sukses', response['message'] ?? 'OTP berhasil dikirim.', snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Registrasi Gagal', response['message'] ?? 'Email sudah digunakan atau error lain.', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak dapat terhubung ke server.', snackPosition: SnackPosition.BOTTOM);
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp() async {
    if (otpController.text.length != maxPinLength || currentEmailForRegistration.value.isEmpty) {
      Get.snackbar('Error', 'Masukkan 6 digit OTP.', 
        snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      return;
    }
    isLoading.value = true;
    try {
      final response = await _authService.verifyOtp(currentEmailForRegistration.value, otpController.text);
      if (response['status'] == 'verified') {
        Get.to(() => CreateNamePage()); 
      } else {
        Get.snackbar('Verifikasi OTP Gagal', response['message'] ?? 'OTP salah atau kadaluarsa.', 
          snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.orange.withOpacity(0.8), colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak dapat terhubung ke server.', 
        snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setUserName() async {
    if (nameController.text.isEmpty || currentEmailForRegistration.value.isEmpty) {
      Get.snackbar('Error', 'Nama tidak boleh kosong.', 
        snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      return;
    }
    if (nameController.text.length < 3) {
      Get.snackbar('Error', 'Nama minimal 3 karakter.', 
        snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.orange.withOpacity(0.8), colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    try {
      final response = await _authService.setName(currentEmailForRegistration.value, nameController.text);
      if (response['status'] == 'name_saved') {
        Get.to(() => CreatePinPage());
      } else {
        Get.snackbar('Set Nama Gagal', response['message'] ?? 'Terjadi kesalahan.', 
          snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak dapat terhubung ke server.', 
        snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> setUserPin() async {
    // Hanya validasi PIN utama
    if (!validateCreatePin()) return;

    isLoading.value = true;
    try {
      final response = await _authService.setPin(currentEmailForRegistration.value, pinInputController.text);
      if (response['status'] == 'registered' && response['token'] != null) {
        _token = response['token'];
        await _storageService.saveToken(_token!);
        authenticatedUser.value = User.fromJson(response['user'] as Map<String, dynamic>);
        isAuthenticated.value = true;
        
        emailController.clear();
        nameController.clear();
        otpController.clear();
        clearPinCreationData(); 

        Get.offAll(() => Home());
      } else {
        Get.snackbar('Set PIN Gagal', response['message'] ?? 'Terjadi kesalahan.', snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      }
    } catch (e) {
      Get.snackbar('Error', 'Tidak dapat terhubung ke server.', snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(10), backgroundColor: Colors.red.withOpacity(0.8), colorText: Colors.white);
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  // --- Logout ---
  Future<void> logout() async {
    isLoading.value = true;
    try {
      if (_token != null) {
        await _authService.logout();
      }
    } catch (e) {
      print("Error logging out from server: $e");
    } finally {
      _token = null;
      authenticatedUser.value = null;
      isAuthenticated.value = false;
      await _storageService.deleteToken();
      await _storageService.deleteUserEmail(); 
      
      // Bersihkan semua input fields
      emailController.clear();
      nameController.clear();
      otpController.clear();
      clearPinCreationData();
      currentEmailForRegistration.value = '';

      isLoading.value = false;
      Get.offAll(()=> StartPage());
    }
  }


  // --- PIN Creation Methods ---
  void updatePinState(String value) { 
    isPinComplete.value = value.length == maxPinLength;
  }
  
  // Hapus clearPinData, ganti dengan yang lebih spesifik
  void clearPinCreationData() { 
    pinInputController.clear(); 
    isPinComplete.value = false;
    isPinObscured.value = true;
  }
  
  void resetPinVisibility() { 
    isPinObscured.value = true;
  }
  
  bool isPinDotFilled(int index, {bool isConfirm = false}) {
    return index < pinInputController.text.length;
  }
  
  String getPinDigit(int index, {bool isConfirm = false}) {
    if (index < pinInputController.text.length) {
      return pinInputController.text[index];
    }
    return '';
  }
  
  // Validasi PIN utama (tetap sama)
  bool validateCreatePin() { 
    if (pinInputController.text.length != maxPinLength) {
      Get.snackbar('PIN Belum Lengkap', 'Harap masukkan $maxPinLength digit PIN', snackPosition: SnackPosition.TOP, margin: EdgeInsets.all(10), backgroundColor: Colors.orange.withOpacity(0.8), colorText: Colors.white);
      return false;
    }
    if (_isSequentialPin(pinInputController.text)) {
      Get.snackbar('PIN Tidak Aman', 'Hindari nomor berulang & berurut, contoh 123456', snackPosition: SnackPosition.TOP, margin: EdgeInsets.all(10), backgroundColor: Colors.orange.withOpacity(0.8), colorText: Colors.white);
      return false;
    }
    if (_isRepeatedPin(pinInputController.text)) {
      Get.snackbar('PIN Tidak Aman', 'Hindari nomor yang berulang, contoh 111111', snackPosition: SnackPosition.TOP, margin: EdgeInsets.all(10), backgroundColor: Colors.orange.withOpacity(0.8), colorText: Colors.white);
      return false;
    }
    return true;
  }
  
  
  
  
  bool _isSequentialPin(String pin) {
    bool isAscending = true;
    bool isDescending = true;
    for (int i = 1; i < pin.length; i++) {
      int current = int.parse(pin[i]);
      int previous = int.parse(pin[i - 1]);
      if (current != previous + 1) isAscending = false;
      if (current != previous - 1) isDescending = false;
    }
    return isAscending || isDescending;
  }
  
  bool _isRepeatedPin(String pin) {
    if (pin.isEmpty) return false;
    String firstDigit = pin[0];
    return pin.split('').every((digit) => digit == firstDigit);
  }

  // Helper untuk membersihkan state saat pindah halaman form
  void clearEmailInput() {
    emailController.clear();
  }
  void clearOtpInput() {
    otpController.clear();
  }
   void clearNameInput() {
    nameController.clear();
  }
  void clearPinLoginInput() { 
    pinInputController.clear();
  }
}