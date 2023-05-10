import 'package:flutter/material.dart';

/// We only allow colors from http://www.groupongig.com/mixer/colors.html
/// If the color provided by a designer does exist in this file already,
/// then check if it's in mixer - if yes, add it otherwise call out the designer
class AppColors {
  static const Color teal400 = Color(0xFF02E2EE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grayWhite = Color(0xFFF0F2F5);
  static const Color gray2 = Color(0xFFE1E4EA);
  static const Color gray3 = Color(0xFFD7D7D7);
  static const Color gray050 = Color(0xFFF6F7F8);
  static const Color gray100 = Color(0xFFE6E7E8);
  static const Color gray200 = Color(0xFFD5D8DB);
  static const Color gray400 = Color(0xFFA5A8AB);
  static const Color gray600 = Color(0xFF707174);

  static const Color black = Color(0xFF333333);
  static const Color red050 = Color(0xFFFFF1F4);
  static const Color red2 = Color(0xFFD43E2A);
  static const Color red600 = Color(0xFFEB003C);
  static const Color blue050 = Color(0xFFE8F8FF);
  static const Color blue500 = Color(0xFF1C75BC);

  static const Color pinkLight = Color(0xFFFAD4D1);

  /// 248 255
  static const Color blue600 = Color(0xFF0076D6);
  static const Color blue3 = Color(0xFF1F242D);
  static const Color blue5 = Color(0xFF343D4C);
  static const Color blue6 = Color(0xFF292D32);
  static const Color blue4 = Color(0xFF536179);
  static const Color blue2 = Color(0xFF8694AC);

  static const Color purple600 = Color(0xFF6650D7);

  static const Color lightGreen = Color(0xFF81A713);
  static const Color lightYellow = Color(0xFFF3FBDA);

  static const Color appTeal = teal400;
}

class AppSmartColors {
  factory AppSmartColors.of(BuildContext context) =>
      AppSmartColors._(Theme.of(context).brightness);

  AppSmartColors._(Brightness brightness)
      : _isBright = brightness == Brightness.light;

  bool _isBright;

  static const Color _gray700 = Color(0xFF616161);
  static const Color _gray500 = Color(0xFF9E9E9E);
  static const Color _blue200 = Color(0xFF90CAF9);

  Color get white => _isBright ? AppColors.white : AppColors.black;

  Color get black => _isBright ? AppColors.black : AppColors.gray100;

  Color get gray050 => _isBright ? AppColors.gray050 : _gray700;

  Color get gray100 => _isBright ? AppColors.gray100 : _gray700;

  Color get gray200 => _isBright ? AppColors.gray200 : _gray500;

  Color get gray400 => AppColors.gray400;

  Color get gray600 => _isBright ? AppColors.gray600 : AppColors.gray100;

  Color get blue050 => _isBright ? AppColors.blue050 : AppColors.blue600;

  Color get blue600 => _isBright ? AppColors.blue600 : _blue200;

  Color get red050 => _isBright ? AppColors.red050 : AppColors.red600;

  Color get purple600 => _isBright ? AppColors.purple600 : AppColors.purple600;
}
