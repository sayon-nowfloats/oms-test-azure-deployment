import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oms/shared/email_validator.dart';
import 'package:oms/shared/widgets/buttons.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/authentication/controllers/login_form_controller.dart';
import 'package:oms/views/authentication/widgets/form_input_field.dart';

class LoginForm extends GetView<LoginFormController> {
  LoginForm({Key? key}) : super(key: key);

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome back",
          style:
              AppTextTheme.of(context).title.copyWith(color: AppColors.blue3),
        ),
        const SizedBox(height: 4),
        Text(
          "Please enter your contact details to connect",
          style: AppTextTheme.of(context).h4.copyWith(color: AppColors.blue4),
        ),
        const SizedBox(height: 30),
        Form(
          key: _loginFormKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormInputField(
                    name: "Email address",
                    label: "Enter your Email address",
                    inputType: TextInputType.emailAddress,
                    validator: (value) => EmailValidator.validate(value ?? "")
                        ? null
                        : "Please enter a valid email",
                    onChanged: (String value) {
                      controller.email.value = value;
                    },
                  ),
                  const SizedBox(height: 20),
                  FormInputField(
                    name: "Password",
                    label: "Enter your Password",
                    obscureText: true,
                    showUnHideTextIcon: true,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please enter a value";
                      }
                      return null;
                    },
                    onChanged: (String value) {
                      controller.password.value = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                value: controller.rememberPassword.value,
                                onChanged: (bool? value) {
                                  controller.rememberPassword.value =
                                      !controller.rememberPassword.value;
                                },
                              ),
                            ),
                            Text(
                              "Remember me",
                              style: AppTextTheme.of(context).h4.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.blue3,
                                  ),
                            )
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            style: AppTextTheme.of(context).h4.copyWith(
                                  color: AppColors.blue3,
                                ),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Forgot password",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = controller
                                      .homeController.onTapForgotPassword,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: AppButton(
                        shape: AppButtonShape.roundedRectangle,
                        type: AppButtonType.primary,
                        onPressed: !_hasValidInputs()
                            ? null
                            : () {
                                if (_loginFormKey.currentState!.validate()) {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(content: Text('Processing Data')),
                                  // );
                                  controller.login();
                                }
                              },
                        child: Text(
                          "Log in",
                          style: AppTextTheme.of(context).h4.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: 'Don’t have an account ? ',
                style: AppTextTheme.of(context).h4.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.blue3,
                    ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign up here',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                    recognizer: TapGestureRecognizer()
                      ..onTap = controller.homeController.onTapSignUpHere,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool _hasValidInputs() =>
      controller.email.isNotEmpty && controller.password.isNotEmpty;
}
