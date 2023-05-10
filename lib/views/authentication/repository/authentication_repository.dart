import 'package:oms/services/networking/api_service.dart';
import 'package:oms/shared/typedef.dart';
import 'package:oms/views/authentication/models/forgot_password_request_model.dart';
import 'package:oms/views/authentication/models/login_request_model.dart';
import 'package:oms/views/authentication/models/signup_request_model.dart';

class AuthenticationRepository {
  final ApiService _apiService;

  AuthenticationRepository(this._apiService);

  Future<JSON> login(LoginRequestModel request) async {
    return await _apiService.post(
      endpoint: '/auth/login',
      body: request.toJson(),
    );
  }

  Future<JSON> signUp(SignupRequestModel request) async {
    return await _apiService.post(
      endpoint: '/auth/signup',
      body: request.toJson(),
    );
  }

  Future<JSON> forgotPassword(ForgotPasswordRequestModel request) async {
    return await _apiService.post(
      endpoint: '/auth/forgetPassword',
      body: request.toJson(),
    );
  }

  Future<JSON> otpVerification(String otp, String email) async {
    return await _apiService.post(
      endpoint: '/auth/loginbyotp',
      body: {
        "otp": otp,
        "email": email,
      },
    );
  }
}
