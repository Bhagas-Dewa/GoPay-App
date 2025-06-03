import 'dart:async';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // OTP related variables
  RxInt countdown = 30.obs;
  RxBool canResend = false.obs;
  Timer? _timer;

  // PIN related variables
  RxString currentPin = ''.obs;
  RxString confirmPin = ''.obs;
  RxBool isPinObscured = true.obs;
  RxBool isConfirmPinObscured = true.obs;
  RxBool isPinComplete = false.obs;
  RxBool isConfirmPinComplete = false.obs;
  RxBool isPinMatched = false.obs;
  
  // PIN Configuration
  static const int maxPinLength = 6;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  // ================ OTP METHODS ================
  void startCountdown() {
    countdown.value = 120;
    canResend.value = false;

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  void resendOtp() {
    if (canResend.value) {
      // TODO: Implement your resend OTP API call here
      // For now, just reset countdown
      startCountdown();
    }
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}.${remainingSeconds.toString().padLeft(2, '0')}';
  }

  // ================ PIN METHODS ================
  
  // Update PIN value (for create PIN)
  void updatePin(String value) {
    if (value.length <= maxPinLength) {
      currentPin.value = value;
      isPinComplete.value = value.length == maxPinLength;
      _checkPinMatch();
    }
  }
  
  // Update confirm PIN value (for confirm PIN)
  void updateConfirmPin(String value) {
    if (value.length <= maxPinLength) {
      confirmPin.value = value;
      isConfirmPinComplete.value = value.length == maxPinLength;
      _checkPinMatch();
    }
  }
  
  // Check if PIN and confirm PIN match
  void _checkPinMatch() {
    if (currentPin.value.isNotEmpty && confirmPin.value.isNotEmpty) {
      isPinMatched.value = currentPin.value == confirmPin.value;
    } else {
      isPinMatched.value = false;
    }
  }
  
  // Clear PIN data
  void clearPinData() {
    currentPin.value = '';
    confirmPin.value = '';
    isPinComplete.value = false;
    isConfirmPinComplete.value = false;
    isPinMatched.value = false;
  }
  
  // Reset PIN visibility to default
  void resetPinVisibility() {
    isPinObscured.value = true;
    isConfirmPinObscured.value = true;
  }
  
  // Get PIN dots filled status for specific index
  bool isPinDotFilled(int index, {bool isConfirm = false}) {
    String pin = isConfirm ? confirmPin.value : currentPin.value;
    return index < pin.length;
  }
  
  // Get PIN digit at specific index
  String getPinDigit(int index, {bool isConfirm = false}) {
    String pin = isConfirm ? confirmPin.value : currentPin.value;
    if (index < pin.length) {
      return pin[index];
    }
    return '';
  }
  
  // Validate PIN for creation
  bool validateCreatePin() {
    if (currentPin.value.length != maxPinLength) {
      Get.snackbar(
        'PIN Belum Lengkap',
        'Harap masukkan $maxPinLength digit PIN',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
    
    // Check for sequential numbers (123456, 654321)
    if (_isSequentialPin(currentPin.value)) {
      Get.snackbar(
        'PIN Tidak Aman',
        'Hindari nomor berulang & berurut, contoh 123456',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
    
    // Check for repeated digits (111111, 222222)
    if (_isRepeatedPin(currentPin.value)) {
      Get.snackbar(
        'PIN Tidak Aman',
        'Hindari nomor yang berulang, contoh 111111',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
    
    return true;
  }
  
  // Validate PIN confirmation
  bool validateConfirmPin() {
    if (!validateCreatePin()) return false;
    
    if (confirmPin.value.length != maxPinLength) {
      Get.snackbar(
        'Konfirmasi PIN Belum Lengkap',
        'Harap masukkan $maxPinLength digit konfirmasi PIN',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
    
    if (!isPinMatched.value) {
      Get.snackbar(
        'PIN Tidak Sama',
        'PIN dan konfirmasi PIN harus sama',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
    
    return true;
  }
  
  // Check if PIN is sequential
  bool _isSequentialPin(String pin) {
    bool isAscending = true;
    bool isDescending = true;
    
    for (int i = 1; i < pin.length; i++) {
      int current = int.parse(pin[i]);
      int previous = int.parse(pin[i - 1]);
      
      if (current != previous + 1) {
        isAscending = false;
      }
      if (current != previous - 1) {
        isDescending = false;
      }
    }
    
    return isAscending || isDescending;
  }
  
  // Check if PIN has repeated digits
  bool _isRepeatedPin(String pin) {
    String firstDigit = pin[0];
    return pin.split('').every((digit) => digit == firstDigit);
  }
  
  // ================ API INTEGRATION METHODS ================
  
  // Create PIN API call (dummy for now)
  Future<bool> createPinAPI() async {
    try {
      // TODO: Replace with actual API call
      // Example:
      // final response = await apiService.createPin({
      //   'pin': currentPin.value,
      //   'confirm_pin': confirmPin.value,
      // });
      
      // Simulate API delay
      await Future.delayed(Duration(seconds: 2));
      
      // Dummy success response
      Get.snackbar(
        'Berhasil',
        'PIN berhasil dibuat',
        snackPosition: SnackPosition.TOP,
      );
      
      return true;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal membuat PIN: $e',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
  }
  
  // Verify PIN API call (for login)
  Future<bool> verifyPinAPI(String inputPin) async {
    try {
      // TODO: Replace with actual API call
      // Example:
      // final response = await apiService.verifyPin({'pin': inputPin});
      
      // Simulate API delay
      await Future.delayed(Duration(seconds: 1));
      
      // Dummy verification logic
      // In real implementation, this will be handled by backend
      return inputPin.length == maxPinLength;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal verifikasi PIN: $e',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
  }
  
  // Change PIN API call
  Future<bool> changePinAPI(String oldPin, String newPin) async {
    try {
      // TODO: Replace with actual API call
      // Example:
      // final response = await apiService.changePin({
      //   'old_pin': oldPin,
      //   'new_pin': newPin,
      // });
      
      // Simulate API delay
      await Future.delayed(Duration(seconds: 2));
      
      Get.snackbar(
        'Berhasil',
        'PIN berhasil diubah',
        snackPosition: SnackPosition.TOP,
      );
      
      return true;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengubah PIN: $e',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
  }
}