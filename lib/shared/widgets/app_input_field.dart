import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  const AppInputField({
    Key? key,
    this.hintText = "",
    this.labelText = "",
    this.prefixIcon,
    this.clearFieldRequired = false,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final bool clearFieldRequired;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: prefixIcon,
        suffixIcon: clearFieldRequired
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              )
            : null,
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
