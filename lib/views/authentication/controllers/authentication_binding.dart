import 'package:get/get.dart';
import 'package:oms/views/authentication/controllers/authentication_home_controller.dart';
import 'package:oms/views/authentication/controllers/forgot_form_password_controller.dart';
import 'package:oms/views/authentication/controllers/login_form_controller.dart';
import 'package:oms/views/authentication/controllers/otp_verification_form_controller.dart';
import 'package:oms/views/authentication/controllers/sign_up_form_controller.dart';
import 'package:oms/views/authentication/provider/authentication_provider.dart';
import 'package:oms/views/authentication/repository/authentication_repository.dart';

class AuthenticationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationRepository>(
        () => AuthenticationRepository(Get.find()));
    Get.lazyPut<AuthenticationProvider>(
        () => AuthenticationProvider(Get.find()));

    //controllers
    Get.lazyPut<AuthenticationHomeController>(
        () => AuthenticationHomeController());
    Get.lazyPut<SignUpController>(() => SignUpController(Get.find()));
    Get.lazyPut<ForgotPasswordController>(
        () => ForgotPasswordController(Get.find()));
    Get.lazyPut<LoginFormController>(() => LoginFormController(Get.find()));
    Get.lazyPut<OtpVerificationFormControllerController>(
        () => OtpVerificationFormControllerController(Get.find()));
  }
}
