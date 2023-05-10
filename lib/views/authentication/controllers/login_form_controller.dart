import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oms/shared/helpers/storage_helper.dart';
import 'package:oms/shared/widgets/common_widgets.dart';
import 'package:oms/views/authentication/controllers/authentication_home_controller.dart';
import 'package:oms/views/authentication/models/login_request_model.dart';
import 'package:oms/views/authentication/provider/authentication_provider.dart';

class LoginFormController extends GetxController with StateMixin {
  final AuthenticationProvider _authenticationProvider;
  final storage = GetStorage();

  LoginFormController(this._authenticationProvider);

  var email = "".obs;
  var password = "".obs;
  var rememberPassword = false.obs;

  final AuthenticationHomeController homeController = Get.find();

  void login() {
    LoginRequestModel data =
        LoginRequestModel(email: email.value, password: password.value);
    homeController.showLoading();
    _authenticationProvider.doLogin(data).then((data) {
      homeController.hideLoading();
      if (data.success) {
        //set token store it and move
        StorageHelper.setLoginToken(data.data?.accessToken.access.token);
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
        "Sorry can't sign in at this moment",
        type: SnackBarType.error,
      );
    });
  }
}
