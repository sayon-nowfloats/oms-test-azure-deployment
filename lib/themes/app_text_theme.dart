import 'package:flutter/material.dart';
import 'package:oms/themes/app_colors.dart';

class AppTextTheme {
  const AppTextTheme(this._textTheme, this._brightness);

  factory AppTextTheme.of(BuildContext context) =>
      AppTextTheme(Theme.of(context).textTheme, Theme.of(context).brightness);
  final TextTheme _textTheme;
  final Brightness _brightness;

  Color get textColor =>
      _brightness == Brightness.light ? AppColors.black : AppColors.gray100;

  TextStyle get title => TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: 48,
        color: textColor,
        fontWeight: FontWeight.w700,
      );

  TextStyle get h1 => TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: 36,
        color: textColor,
        fontWeight: FontWeight.w700,
      );

  TextStyle get h2 => TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: 24,
        color: textColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle get h2Bold => TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w700,
      );

  TextStyle get h3 => TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle get h4 => TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle get h5 => TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle get h6 => TextStyle(
        fontFamily: 'PlusJakartaSans',
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w500,
      );

  TextStyle get paragraph => _textTheme.headline6!.copyWith(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get medium => _textTheme.headline6!.copyWith(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.w400,
      );

  TextStyle get small => _textTheme.headline6!.copyWith(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w400,
      );
}
