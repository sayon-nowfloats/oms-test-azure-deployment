// import 'package:flutter/foundation.dart'
//     show debugDefaultTargetPlatformOverride, defaultTargetPlatform;
// import 'package:flutter/material.dart';
//
// class DynamicThemeData extends InheritedWidget {
//   const DynamicThemeData({
//     required Widget child,
//     required this.themeMode,
//     Key? key,
//   }) : super(key: key, child: child);
//
//   static DynamicThemeData of(BuildContext context) =>
//       context.dependOnInheritedWidgetOfExactType<DynamicThemeData>()!;
//
//   final ThemeMode themeMode;
//
//   void setThemeMode(BuildContext context, ThemeMode themeMode) {
//     ThemeModeNotification(themeMode).dispatch(context);
//   }
//
//   TargetPlatform get platform =>
//       debugDefaultTargetPlatformOverride ?? defaultTargetPlatform;
//
//   set platform(TargetPlatform value) {
//     if (debugDefaultTargetPlatformOverride != value) {
//       debugDefaultTargetPlatformOverride = value;
//       WidgetsBinding.instance.reassembleApplication();
//     }
//   }
//
//   @override
//   bool updateShouldNotify(DynamicThemeData oldWidget) =>
//       themeMode != oldWidget.themeMode;
// }
//
// class ThemeModeNotification extends Notification {
//   const ThemeModeNotification(this.themeMode);
//
//   final ThemeMode themeMode;
// }
//
// class DynamicTheme extends StatefulWidget {
//   const DynamicTheme({
//     required this.themeMode,
//     required this.child,
//     Key? key,
//   }) : super(key: key);
//
//   final ThemeMode themeMode;
//
//   final Widget child;
//
//   @override
//   _DynamicThemeState createState() => _DynamicThemeState();
// }
//
// class _DynamicThemeState extends State<DynamicTheme> {
//   late ThemeMode _themeMode;
//
//   @override
//   void initState() {
//     _themeMode = widget.themeMode;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<ThemeModeNotification>(
//       onNotification: (notification) {
//         if (_themeMode != notification.themeMode) {
//           setState(() {
//             _themeMode = notification.themeMode;
//           });
//         }
//
//         return false;
//       },
//       child: DynamicThemeData(
//         themeMode: _themeMode,
//         child: widget.child,
//       ),
//     );
//   }
// }
