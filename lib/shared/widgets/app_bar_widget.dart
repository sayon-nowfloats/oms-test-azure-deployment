import 'package:flutter/material.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

enum PopMenuItemsEnum { myProfile, help, logout }

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  PopMenuItemsEnum? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        const Icon(Icons.notification_important),
        const SizedBox(
          width: 10,
        ),
        PopupMenuButton<PopMenuItemsEnum>(
          initialValue: selectedMenu,
          offset: const Offset(0, 50),
          onSelected: (PopMenuItemsEnum item) {
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) =>
              <PopupMenuEntry<PopMenuItemsEnum>>[
            const PopupMenuItem<PopMenuItemsEnum>(
              value: PopMenuItemsEnum.myProfile,
              child: Text('My profile'),
            ),
            const PopupMenuItem<PopMenuItemsEnum>(
              value: PopMenuItemsEnum.help,
              child: Text('Help'),
            ),
            const PopupMenuItem<PopMenuItemsEnum>(
              value: PopMenuItemsEnum.logout,
              child: Text('Log out'),
            ),
          ],
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.pinkLight,
                child: Center(
                  child: Text(
                    'AG',
                    style: AppTextTheme.of(context).h6,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Roshan Joshi",
                style: AppTextTheme.of(context).h6,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        )
      ],
      leading: SizedBox(),
    );
  }
}

class PreferredSizeWidgetWrapper extends StatelessWidget
    implements PreferredSizeWidget {
  PreferredSizeWidgetWrapper({
    Key? key,
    bool addNavigationBarHeight = false,
    required this.child,
  })  : preferredSize = Size.fromHeight(kToolbarHeight +
            (addNavigationBarHeight ? kBottomNavigationBarHeight : 0)),
        super(key: key);

  final Widget child;

  /// A size whose height is the sum of [kToolbarHeight] and may plus
  /// [kBottomNavigationBarHeight] and the widget's preferred height.
  ///
  /// [Scaffold] uses this this size to set its app bar's height.
  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) => child;
}
