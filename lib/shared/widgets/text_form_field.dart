import 'package:flutter/material.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.onChanged,
    this.name = "",
    this.label = "",
    this.obscureText = false,
    this.showUnHideTextIcon = false,
    this.inputType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  final String name;
  final String label;
  final bool obscureText;
  final bool showUnHideTextIcon;
  final FormFieldValidator<String>? validator;
  final TextInputType inputType;
  final Function(String) onChanged;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool _obscureText = true;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      obscureText: _obscureText,
      style: AppTextTheme.of(context).h4.copyWith(
            color: AppColors.blue2,
            fontWeight: FontWeight.w400,
          ),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.blue3, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        errorStyle: AppTextTheme.of(context)
            .h5
            .copyWith(fontWeight: FontWeight.w400, color: AppColors.red2),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray3, width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: widget.label,
        suffixIcon: widget.showUnHideTextIcon
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.blue6,
                ),
                onPressed: _toggle,
              )
            : const IgnorePointer(),
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
