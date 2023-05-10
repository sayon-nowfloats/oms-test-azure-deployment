import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oms/generated/assets.dart';
import 'package:oms/shared/widgets/common_widgets.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/authentication/controllers/authentication_home_controller.dart';

enum ViewType { login, signup, otpVerification, resetPassword, forgotPassword }

class AuthenticationHomePage extends GetView<AuthenticationHomeController> {
  const AuthenticationHomePage({
    Key? key,
    this.viewTypes = const [ViewType.login],
    this.initialPageIndex = 0,
  }) : super(key: key);

  final List<ViewType> viewTypes;
  final int initialPageIndex;

  @override
  Widget build(BuildContext context) {
    controller.setPageViewWidgets(viewTypes);
    controller.setPageController(pageIndex: initialPageIndex);
    return controller.obx(
      (state) => Scaffold(
        appBar: AppBar(
          title: SvgPicture.network(
            "https://jiw-oms-cdn-staging.azureedge.net/oms-frontend/nowfloats.svg",
            width: 50,
            height: 50,
          ),
          centerTitle: false,
          leading: const SizedBox(),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: [
              Text(
                "Terms & condition",
                style: AppTextTheme.of(context)
                    .h4
                    .copyWith(color: AppColors.blue2),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                "Privacy policy",
                style: AppTextTheme.of(context)
                    .h4
                    .copyWith(color: AppColors.blue2),
              ),
            ],
          ),
        ),
        body: Row(
          children: [
            Expanded(
              child: Image.asset(
                Assets.imagesLoginImage,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: controller.pageController,
                  children: controller.pageViewWidgets,
                ),
              ),
            ),
          ],
        ),
      ),
      onLoading: CommonWidgets.showCenteredLoader(),
    );
  }
}
