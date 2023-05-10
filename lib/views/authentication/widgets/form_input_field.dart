import 'package:flutter/material.dart';
import 'package:oms/shared/widgets/text_form_field.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

class FormInputField extends StatelessWidget {
  const FormInputField({
    Key? key,
    required this.onChanged,
    this.name = "",
    this.label = "",
    this.obscureText = false,
    this.showUnHideTextIcon = false,
    this.validator,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  final String name;
  final String label;
  final bool obscureText;
  final bool showUnHideTextIcon;
  final TextInputType inputType;
  final FormFieldValidator<String>? validator;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppTextTheme.of(context)
              .h4
              .copyWith(color: AppColors.blue3, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 8,
        ),
        // TextFormField(
        //   keyboardType: TextInputType.text,
        //   obscureText: obscureText,
        //   decoration: InputDecoration(
        //     contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        //     border: const OutlineInputBorder(),
        //     floatingLabelBehavior: FloatingLabelBehavior.never,
        //     labelText: label,
        //   ),
        //   validator: validator,
        // ),
        TextFormFieldWidget(
          label: label,
          obscureText: obscureText,
          validator: validator,
          showUnHideTextIcon: showUnHideTextIcon,
          inputType: inputType,
          onChanged: onChanged,
        )
      ],
    );
  }
}
