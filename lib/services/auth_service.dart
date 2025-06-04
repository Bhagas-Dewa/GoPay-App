// lib/services/auth_service.dart
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:gopay_task/models/user_model.dart';
import 'package:gopay_task/services/storage_service.dart';


class AuthService extends GetxService {
  final Dio _dio = Dio();
  final StorageService _storageService = Get.find<StorageService>(); 

  final String _baseUrl = 'https://gopay-app-backend-production.up.railway.app/api/v1/auth';

  AuthService() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = Duration(seconds: 10); 
    _dio.options.receiveTimeout = Duration(seconds: 10); 
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Cek jika request butuh token
          if (options.path != '/check-email-login' &&
              options.path != '/login-pin' &&
              options.path != '/check-email-register' &&
              options.path != '/verify-otp' &&
              options.path != '/set-name' &&
              options.path != '/set-pin') { 
            String? token = await _storageService.getToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          options.headers['Accept'] = 'application/json'; 
          print('REQUEST[${options.method}] => PATH: ${options.path} DATA: ${options.data} HEADERS: ${options.headers}');
          return handler.next(options); 
        },
        onResponse: (response, handler) {
          print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print('ERROR[${e.response?.statusCode}] => MESSAGE: ${e.message} DATA: ${e.response?.data}');
          return handler.next(e);
        },
      ),
    );
  }

  // Check Email for Login
  Future<Map<String, dynamic>> checkEmailLogin(String email) async {
    try {
      final response = await _dio.post('/check-email-login', data: {'email': email});
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      return e.response?.data as Map<String, dynamic>? ?? {'status': 'error', 'message': e.message ?? 'Network error'};
    }
  }

  // Login with PIN
  Future<Map<String, dynamic>> loginWithPin(String email, String pin) async {
    try {
      final response = await _dio.post('/login-pin', data: {'email': email, 'pin_code': pin});
      if (response.data['status'] == 'success' && response.data['token'] != null) {
        await _storageService.saveToken(response.data['token']);
        if (response.data['user'] != null) {
            await _storageService.saveUserEmail(response.data['user']['email']);
        }
      }
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
       return e.response?.data as Map<String, dynamic>? ?? {'status': 'error', 'message': e.message ?? 'Network error'};
    }
  }

  // Check Email for Register (and send OTP)
  Future<Map<String, dynamic>> checkEmailRegister(String email) async {
    try {
      final response = await _dio.post('/check-email-register', data: {'email': email});
      if (response.data['status'] == 'otp_sent') {
        await _storageService.saveUserEmail(email); 
      }
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
       return e.response?.data as Map<String, dynamic>? ?? {'status': 'error', 'message': e.message ?? 'Network error'};
    }
  }

  // Verify OTP
  Future<Map<String, dynamic>> verifyOtp(String email, String otpCode) async {
    try {
      final response = await _dio.post('/verify-otp', data: {'email': email, 'otp_code': otpCode});
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      return e.response?.data as Map<String, dynamic>? ?? {'status': 'error', 'message': e.message ?? 'Network error'};
    }
  }

  // Set Name
  Future<Map<String, dynamic>> setName(String email, String name) async {
    try {
      final response = await _dio.post('/set-name', data: {'email': email, 'name': name});
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      return e.response?.data as Map<String, dynamic>? ?? {'status': 'error', 'message': e.message ?? 'Network error'};
    }
  }

  // Set PIN (and create user)
  Future<Map<String, dynamic>> setPin(String email, String pin) async {
    try {
      final response = await _dio.post('/set-pin', data: {'email': email, 'pin_code': pin});
      if (response.data['status'] == 'registered' && response.data['token'] != null) {
        await _storageService.saveToken(response.data['token']);
         if (response.data['user'] != null) {
            await _storageService.saveUserEmail(response.data['user']['email']);
        }
      }
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      return e.response?.data as Map<String, dynamic>? ?? {'status': 'error', 'message': e.message ?? 'Network error'};
    }
  }

  // Get Authenticated User Profile
  Future<User?> getMe() async {
    try {
      final response = await _dio.get('/me');
      if (response.data['status'] == 'success' && response.data['data'] != null) {
        final user = User.fromJson(response.data['data'] as Map<String, dynamic>);
        await _storageService.saveUserEmail(user.email); 
        return user;
      }
      return null;
    } on DioException catch (e) {
      print('Error fetching user: $e');
      if (e.response?.statusCode == 401) {
        await _storageService.deleteToken(); 
        await _storageService.deleteUserEmail();
      }
      return null;
    }
  }

  // Logout User
  Future<Map<String, dynamic>> logout() async {
    try {
      final response = await _dio.post('/logout'); 
      await _storageService.deleteToken();
      await _storageService.deleteUserEmail();
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
         await _storageService.deleteToken();
         await _storageService.deleteUserEmail();
      }
      return e.response?.data as Map<String, dynamic>? ?? {'status': 'error', 'message': e.message ?? 'Network error'};
    }
  }
}