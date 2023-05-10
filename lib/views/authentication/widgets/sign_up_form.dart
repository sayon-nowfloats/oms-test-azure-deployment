import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oms/shared/email_validator.dart';
import 'package:oms/shared/widgets/buttons.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/authentication/controllers/sign_up_form_controller.dart';
import 'package:oms/views/authentication/widgets/form_input_field.dart';

class SignUpForm extends GetView<SignUpController> {
  SignUpForm({Key? key}) : super(key: key);

  final _signUpFormKey = GlobalKey<FormState>(debugLabel: 'signUpKey');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Sign up",
          style: AppTextTheme.of(context).title.copyWith(
                color: AppColors.blue3,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          "Please enter your contact to create your account",
          style: AppTextTheme.of(context).h4.copyWith(
                color: AppColors.blue4,
              ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: _signUpFormKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormInputField(
                    name: "Name",
                    label: "Enter your name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (String value) {
                      controller.name.value = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormInputField(
                    name: "Email address",
                    label: "Enter your email",
                    validator: (value) => EmailValidator.validate(value ?? "")
                        ? null
                        : "Please enter a valid email",
                    onChanged: (String value) {
                      controller.email.value = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormInputField(
                    name: "Password",
                    label: "Enter your Password",
                    obscureText: true,
                    showUnHideTextIcon: true,
                    validator: (value) {
                      return null;
                    },
                    onChanged: (String value) {
                      controller.password.value = value;
                      if (controller.password.value.length > 6) {
                        return "Please enter at least 6 digit password";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormInputField(
                    name: "Confirm password",
                    label: "Confirm password",
                    obscureText: true,
                    showUnHideTextIcon: true,
                    validator: (value) {
                      if (controller.password.compareTo(value ?? "") == -1) {
                        return " The confirmation password does not match.";
                      }
                      return null;
                    },
                    onChanged: (String value) {
                      controller.confirmPassword.value = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Obx(
                        () => AppButton(
                          shape: AppButtonShape.roundedRectangle,
                          type: AppButtonType.primary,
                          onPressed: !_hasValidInputs()
                              ? null
                              : () {
                                  if (_signUpFormKey.currentState!.validate()) {
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(content: Text('Processing Data')),
                                    // );
                                    controller.signUp();
                                  }
                                },
                          child: Text(
                            "Sign up",
                            style: AppTextTheme.of(context).h4.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: AppTextTheme.of(context).h4.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blue3,
                              ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Log in',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => controller.homeController
                                    .navigateToPrevious(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  bool _hasValidInputs() =>
      controller.name.isNotEmpty &&
      controller.email.isNotEmpty &&
      controller.password.isNotEmpty &&
      controller.confirmPassword.isNotEmpty;
}
