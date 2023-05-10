import 'package:get/get.dart';
import 'package:oms/shared/widgets/common_widgets.dart';
import 'package:oms/views/authentication/controllers/authentication_home_controller.dart';
import 'package:oms/views/authentication/models/forgot_password_request_model.dart';
import 'package:oms/views/authentication/provider/authentication_provider.dart';

class ForgotPasswordController extends GetxController with StateMixin {
  final AuthenticationProvider _authenticationProvider;
  final AuthenticationHomeController homeController = Get.find();
  var email = "".obs;

  ForgotPasswordController(this._authenticationProvider);

  void onTapForgotPassword() {
    ForgotPasswordRequestModel data =
        ForgotPasswordRequestModel(email: email.value);

    homeController.showLoading();

    _authenticationProvider.forgotPassword(data).then((data) {
      homeController.hideLoading();
      CommonWidgets.snackBar(
        data.message,
        type: SnackBarType.error,
      );
    }).catchError((error) {
      homeController.hideLoading();
      CommonWidgets.snackBar(
        "Sorry can't do this at this moment",
        type: SnackBarType.error,
      );
    });
  }
}
