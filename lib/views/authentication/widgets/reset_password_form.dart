import 'package:flutter/material.dart';
import 'package:oms/shared/widgets/buttons.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/authentication/widgets/form_input_field.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Reset Password",
          style: AppTextTheme.of(context).title.copyWith(
                color: AppColors.blue3,
              ),
        ),
        Text(
          "Please create your new password in order to login",
          style: AppTextTheme.of(context).h4.copyWith(
                color: AppColors.blue4,
              ),
        ),
        const SizedBox(height: 20),
        FormInputField(
          name: "Password",
          label: "Enter Password",
          obscureText: true,
          validator: (value) {
            return null;
          },
          onChanged: (String value) {},
        ),
        const SizedBox(height: 30),
        FormInputField(
          name: "Confirm Password",
          label: "Enter Password",
          obscureText: true,
          validator: (value) {
            return null;
          },
          onChanged: (String value) {},
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: AppButton(
            shape: AppButtonShape.roundedRectangle,
            type: AppButtonType.primary,
            onPressed: () {
              // if (_formKey.currentState!.validate()) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('Processing Data')),
              //   );
              // }
            },
            child: Text(
              "Reset",
              style: AppTextTheme.of(context).h4.copyWith(
                  fontWeight: FontWeight.w700, color: AppColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
