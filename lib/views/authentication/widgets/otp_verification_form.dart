import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oms/shared/widgets/buttons.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/authentication/controllers/authentication_home_controller.dart';
import 'package:oms/views/authentication/controllers/otp_verification_form_controller.dart';
import 'package:oms/views/authentication/widgets/form_input_field.dart';

class OtpVerificationForm
    extends GetView<OtpVerificationFormControllerController> {
  const OtpVerificationForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthenticationHomeController homeController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBackButton(
          onTapBack: () {
            homeController.navigateToPrevious();
          },
        ),
        const Divider(),
        Text(
          "OTP Verification",
          style: AppTextTheme.of(context).title.copyWith(
                color: AppColors.blue3,
              ),
        ),
        Text(
          "Enter the OTP  shared on you  mail ",
          style: AppTextTheme.of(context).h4.copyWith(
                color: AppColors.blue4,
              ),
        ),
        const SizedBox(
          height: 20,
        ),
        FormInputField(
          name: "OTP",
          label: "Enter OTP",
          obscureText: true,
          validator: (value) {
            return null;
          },
          onChanged: (String value) {
            controller.otp.value = value;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: SizedBox(
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
                controller.verifyOtp();
              },
              child: Text(
                "Verify",
                style: AppTextTheme.of(context).h4.copyWith(
                    fontWeight: FontWeight.w700, color: AppColors.white),
              ),
            ),
          ),
        ),
        //TODO:need to enable once api is ready
        // RichText(
        //   text: TextSpan(
        //     text: 'OTP not received? ',
        //     style: AppTextTheme.of(context).h4.copyWith(
        //           fontWeight: FontWeight.w400,
        //           color: AppColors.blue3,
        //         ),
        //     children: <TextSpan>[
        //       TextSpan(
        //         text: 'Resend',
        //         style: const TextStyle(fontWeight: FontWeight.w600),
        //         recognizer: TapGestureRecognizer()..onTap = () {},
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class FormBackButton extends StatelessWidget {
  const FormBackButton({
    Key? key,
    this.onTapBack,
  }) : super(key: key);

  final VoidCallback? onTapBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTapBack,
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Back',
          style: AppTextTheme.of(context).h4,
        )
      ],
    );
  }
}
