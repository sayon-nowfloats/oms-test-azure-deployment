import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

enum SnackBarType { success, error, generic }

Map<SnackBarType, IconData> _snackBarIconMapper = {
  SnackBarType.success: Icons.check_circle_outline_outlined,
  SnackBarType.error: Icons.error_outline,
};

Map<SnackBarType, Color> _snackBackgroundMapper = {
  SnackBarType.success: AppColors.lightYellow,
  SnackBarType.error: AppColors.red050,
};

class CommonWidgets {
  static void snackBar(
    String message, {
    SnackBarType type = SnackBarType.generic,
  }) async {
    Get.rawSnackbar(
      message: message,
      snackPosition: SnackPosition.TOP,
      maxWidth: 380,
      borderRadius: 8,
      //boxShadows:
      backgroundColor: _snackBackgroundMapper[type] ?? AppColors.lightYellow,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
      margin: const EdgeInsets.only(top: 50),
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Visibility(
            visible: _snackBarIconMapper[type] != null,
            child: Icon(
              _snackBarIconMapper[type],
              color: AppColors.blue3,
            ),
          ),
          Text(message)
        ],
      ),
    );
  }

  static void showSuccessToast(String title, String message) async {
    Get.snackbar(
      title,
      message,
      maxWidth: 350,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

  static Widget showCenteredLoader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    color: AppColors.lightGreen,
                    strokeWidth: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget showBottomLoader({String title = "Loading.."}) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (BuildContext context) => Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightYellow,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                          color: AppColors.lightGreen,
                        ),
                      ),
                      Text(
                        title,
                        style: AppTextTheme.of(context).h5.copyWith(
                              color: AppColors.blue3,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}

class Utils {
  late BuildContext context;

  Utils(this.context);

  // this is where you would do your fullscreen loading
  Future<void> startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor:
              Colors.transparent, // can change this to your prefered color
          children: <Widget>[
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    Navigator.of(context).pop();
  }

  Future<void> showError(Object? error) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        backgroundColor: Colors.red,
        content: Text("error"),
      ),
    );
  }
}
