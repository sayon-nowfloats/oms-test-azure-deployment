import 'package:oms/views/authentication/models/forgot_password_request_model.dart';
import 'package:oms/views/authentication/models/login_request_model.dart';
import 'package:oms/views/authentication/models/login_response_model.dart';
import 'package:oms/views/authentication/models/signup_request_model.dart';
import 'package:oms/views/authentication/models/signup_response_model.dart';
import 'package:oms/views/authentication/repository/authentication_repository.dart';

class AuthenticationProvider {
  final AuthenticationRepository _loginRepository;

  AuthenticationProvider(this._loginRepository);

  Future<LoginResponseModel> doLogin(LoginRequestModel request) async {
    var res = await _loginRepository.login(request);
    return LoginResponseModel.fromJson(res);
  }

  Future<SignupResponseModel> doSignup(SignupRequestModel request) async {
    var res = await _loginRepository.signUp(request);
    return SignupResponseModel.fromJson(res);
  }

  Future<SignupResponseModel> forgotPassword(
    ForgotPasswordRequestModel request,
  ) async {
    var res = await _loginRepository.forgotPassword(request);
    return SignupResponseModel.fromJson(res);
  }

  Future<LoginResponseModel> doOtpVerification(String otp, String email) async {
    var res = await _loginRepository.otpVerification(otp, email);
    return LoginResponseModel.fromJson(res);
  }
}
