import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

class ResetPasswordConfirmationWidget extends StatelessWidget {
  const ResetPasswordConfirmationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Reset Password confirmation",
          style: AppTextTheme.of(context).title.copyWith(
                color: AppColors.blue3,
              ),
        ),
        Container(
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
            color: AppColors.lightYellow,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline),
              const SizedBox(
                width: 10,
              ),
              RichText(
                text: TextSpan(
                  text:
                      'Your password is reset now you can log in into your account.  ',
                  style: AppTextTheme.of(context).h3.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue3,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Log in',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
