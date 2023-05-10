import 'package:get/get.dart';
import 'package:oms/shared/widgets/common_widgets.dart';
import 'package:oms/views/authentication/controllers/authentication_home_controller.dart';
import 'package:oms/views/authentication/controllers/sign_up_form_controller.dart';
import 'package:oms/views/authentication/provider/authentication_provider.dart';

class OtpVerificationFormControllerController extends GetxController
    with StateMixin {
  final AuthenticationProvider _authenticationProvider;
  final AuthenticationHomeController homeController = Get.find();

  OtpVerificationFormControllerController(this._authenticationProvider);

  var otp = "".obs;
  final SignUpController signUpController = Get.find();

  @override
  void onInit() {
    print("signUpController.email.value---> ${signUpController.email.value}");
    super.onInit();
  }

  void verifyOtp() {
    homeController.showLoading();
    _authenticationProvider
        .doOtpVerification(otp.value, signUpController.email.value)
        .then((data) {
      homeController.hideLoading();
      if (data.success) {
        Get.offAllNamed('/home');
      } else {
        CommonWidgets.snackBar(
          data.message,
          type: SnackBarType.error,
        );
      }
    }).catchError((error) {
      homeController.hideLoading();
      //get error
      CommonWidgets.snackBar(
        "Oops! something went wrong",
        type: SnackBarType.error,
      );
    });
  }
}
