import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oms/themes/app_colors.dart';

// const MaterialColor _kG2LightSwatch = MaterialColor(
//   0xFF669900,
//   <int, Color>{
//     50: Color(0xFFE8F5E9),
//     100: Color(0xFFC8E6C9),
//     200: Color(0xFFA5D6A7),
//     300: Color(0xFF81C784),
//     400: Color(0xFF66BB6A),
//     500: AppColors.appGreen,
//     600: Color(0xFF43A047),
//     700: Color(0xFF388E3C),
//     800: Color(0xFF2E7D32),
//     900: Color(0xFF1B5E20),
//   },
// );

ThemeData lightTheme() => ThemeData(
      // textTheme: GoogleFonts.openSansTextTheme(),
      primaryTextTheme: ThemeData.light().primaryTextTheme,
      primaryColor: AppColors.blue3,
      // primaryColorDark: AppColors.blue3,
      brightness: Brightness.light,
      // primarySwatch: _kG2LightSwatch,
      hoverColor: AppColors.gray050.withOpacity(0.5),
      splashColor: AppColors.gray100.withOpacity(0.5),
      highlightColor: AppColors.gray400,
      splashFactory: InkRipple.splashFactory,
      errorColor: const Color(0xFFFF1744),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        minWidth: 0,
        // buttonColor: _kG2LightSwatch[500],
      ),
      // textSelectionTheme: TextSelectionThemeData(
      //   selectionColor: AppColors.green400.withOpacity(0.2),
      //   selectionHandleColor: AppColors.green400,
      // ),
      primaryIconTheme: const IconThemeData(color: Colors.black),
      //  platform: platform,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        centerTitle: true,
        color: AppColors.white,
        iconTheme: IconThemeData(color: Colors.black),
        toolbarTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 18,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 14,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      unselectedWidgetColor: AppColors.gray400,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.gray050;
            } else if (states.contains(MaterialState.pressed)) {
              return AppColors.gray100;
            }
            return Colors.transparent;
          }),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.fuchsia: OpenUpwardsPageTransitionsBuilder(),
        },
      ),
    );

ThemeData darkTheme() => ThemeData(
      primaryColor: Colors.blue,
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      // scaffoldBackgroundColor: AppColors.gray900,
      appBarTheme: AppBarTheme(
        // backgroundColor: AppColors.gray900,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      // bottomAppBarColor: AppColors.gray800,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          hintStyle: TextStyle(
            fontSize: 14,
          )),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
      textTheme: TextTheme(
          headline1: TextStyle(
              letterSpacing: -1.5,
              fontSize: 48,
              color: Colors.grey.shade50,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              letterSpacing: -1.0,
              fontSize: 40,
              color: Colors.grey.shade50,
              fontWeight: FontWeight.bold),
          headline3: TextStyle(
              letterSpacing: -1.0,
              fontSize: 32,
              color: Colors.grey.shade50,
              fontWeight: FontWeight.bold),
          headline4: TextStyle(
              letterSpacing: -1.0,
              color: Colors.grey.shade50,
              fontSize: 28,
              fontWeight: FontWeight.w600),
          headline5: TextStyle(
              letterSpacing: -1.0,
              color: Colors.grey.shade50,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          headline6: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 18,
              fontWeight: FontWeight.w500),
          subtitle1: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          subtitle2: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 16,
              fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 14,
              fontWeight: FontWeight.w400),
          button: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
          caption: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 12,
              fontWeight: FontWeight.w500),
          overline: TextStyle(
              color: Colors.grey.shade50,
              fontSize: 10,
              fontWeight: FontWeight.w400)),
    );
