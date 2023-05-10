import 'package:get/get.dart';
import 'package:oms/shared/widgets/common_widgets.dart';
import 'package:oms/views/authentication/controllers/authentication_home_controller.dart';
import 'package:oms/views/authentication/models/signup_request_model.dart';
import 'package:oms/views/authentication/provider/authentication_provider.dart';

class SignUpController extends GetxController with StateMixin {
  final AuthenticationProvider _loginProvider;
  final AuthenticationHomeController homeController = Get.find();
  var name = "".obs;
  var email = "".obs;
  var password = "".obs;
  var confirmPassword = "".obs;

  SignUpController(this._loginProvider);

  void signUp() {
    homeController.showLoading();
    SignupRequestModel request = SignupRequestModel(
      email: email.value,
      password: password.value,
      fullname: name.value,
    );
    _loginProvider.doSignup(request).then((data) {
      homeController.hideLoading();
      if (data.success) {
        homeController.navigateToOtpVerification();
      } else {
        CommonWidgets.snackBar(
          data.message,
          type: SnackBarType.error,
        );
      }
    }).catchError((error) {
      homeController.hideLoading();
      CommonWidgets.snackBar(
        "Sorry can't sign up at this moment",
        type: SnackBarType.error,
      );
    });
  }
}
