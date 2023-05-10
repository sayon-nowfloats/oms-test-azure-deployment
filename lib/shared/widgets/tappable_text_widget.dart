import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

class TappableTextWidget extends StatefulWidget {
  const TappableTextWidget(
      {Key? key,
      required this.text,
      this.textStyle,
      this.highlightTextColor = AppColors.blue500,
      this.onTap})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final Color highlightTextColor;
  final VoidCallback? onTap;

  @override
  State<TappableTextWidget> createState() => _TappableTextWidgetState();
}

class _TappableTextWidgetState extends State<TappableTextWidget> {
  bool hasHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) => setState(() => hasHovered = true),
      onExit: (details) => setState(() {
        hasHovered = false;
      }),
      child: RichText(
        text: TextSpan(
          text: widget.text,
          style: _getTextStyle().copyWith(
            decoration: TextDecoration.underline,
            color: hasHovered ? widget.highlightTextColor : AppColors.black,
          ),
          recognizer: TapGestureRecognizer()..onTap = widget.onTap,
        ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    if (widget.textStyle == null) {
      return AppTextTheme.of(context).h4;
    }
    return widget.textStyle!;
  }
}
