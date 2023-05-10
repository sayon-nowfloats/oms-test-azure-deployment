import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:oms/views/authentication/authentication_home_page.dart';
import 'package:oms/views/authentication/widgets/forgot_password_form.dart';
import 'package:oms/views/authentication/widgets/login_form.dart';
import 'package:oms/views/authentication/widgets/otp_verification_form.dart';
import 'package:oms/views/authentication/widgets/reset_password_form.dart';
import 'package:oms/views/authentication/widgets/sign_up_form.dart';

class AuthenticationHomeController extends GetxController with StateMixin {
  late PageController pageController;
  List<Widget> pageViewWidgets = [];

  @override
  void onReady() {
    hideLoading();
    super.onReady();
  }

  void setPageController({int pageIndex = 0}) {
    pageController = PageController(initialPage: pageIndex);
  }

  void setPageViewWidgets(List<ViewType> viewTypes) {
    pageViewWidgets = [];
    pageViewWidgets = viewTypes.map((type) {
      switch (type) {
        case ViewType.login:
          return LoginForm();
        case ViewType.signup:
          return SignUpForm();
        case ViewType.otpVerification:
          return const OtpVerificationForm();
        case ViewType.resetPassword:
          return const ResetPasswordForm();
        case ViewType.forgotPassword:
          return ForgotPasswordForm();
      }
    }).toList();
  }

  void showLoading() {
    change({}, status: RxStatus.loading());
  }

  void hideLoading() {
    change({}, status: RxStatus.success());
  }

  void onTapForgotPassword() {
    if (!pageViewWidgets.contains(
      ForgotPasswordForm(),
    )) {
      pageViewWidgets.add(
        ForgotPasswordForm(),
      );
    }
    navigateToNext();
  }

  void navigateToOtpVerification() async {
    setPageViewWidgets([
      ViewType.login,
      ViewType.otpVerification,
    ]);
    pageController = PageController(initialPage: 1);
    await pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  void navigateToNext() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  void onTapSignUpHere() {
    pageViewWidgets.add(
      SignUpForm(),
    );
    navigateToNext();
  }

  void navigateToPrevious() {
    pageViewWidgets.removeLast();
    pageController.previousPage(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  void navigateToView(Widget view, {bool replace = false}) {
    if (!pageViewWidgets.contains(view)) {
      pageViewWidgets.add(view);
    }
    pageController.animateToPage(
      pageViewWidgets.indexOf(view),
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    pageViewWidgets = [];
    super.dispose();
  }
}
