import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oms/shared/email_validator.dart';
import 'package:oms/shared/widgets/buttons.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/authentication/controllers/authentication_home_controller.dart';
import 'package:oms/views/authentication/controllers/forgot_form_password_controller.dart';
import 'package:oms/views/authentication/widgets/form_input_field.dart';
import 'package:oms/views/authentication/widgets/otp_verification_form.dart';

final _formKey = GlobalKey<FormState>();

class ForgotPasswordForm extends GetView<ForgotPasswordController> {
  ForgotPasswordForm({Key? key}) : super(key: key);

  final AuthenticationHomeController _authenticationHomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBackButton(
          onTapBack: _authenticationHomeController.navigateToPrevious,
        ),
        Text(
          "Forgot Password",
          style: AppTextTheme.of(context).title.copyWith(
                color: AppColors.blue3,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          "Enter your email and we will send you a reset link",
          style: AppTextTheme.of(context).h4.copyWith(
                color: AppColors.blue4,
              ),
        ),
        const SizedBox(
          height: 20,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: Obx(
                      () => AppButton(
                        shape: AppButtonShape.roundedRectangle,
                        type: AppButtonType.primary,
                        onPressed: controller.email.isEmpty
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   const SnackBar(content: Text('Processing Data')),
                                  // );
                                  controller.onTapForgotPassword();
                                }
                              },
                        child: Text(
                          "Send link",
                          style: AppTextTheme.of(context).h4.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
