import 'package:flutter/material.dart';
import 'package:oms/shared/widgets/buttons.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

class AppDialogs {
  static Future<void> showCustomDialog(
      {required BuildContext context,
      required Widget widget,
      String title = ""}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DialogLayoutWidget(
            body: widget,
            title: title,
          ),
        );
      },
    );
  }

  static Future<void> showAlertDialog({
    required BuildContext context,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter'),
          content: SizedBox(
            width: 200,
            child: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  const Text('Show order from'),
                  RadioListTile(
                    title: Text("Life time"),
                    value: "male",
                    groupValue: "male",
                    onChanged: (value) {},
                  ),
                  RadioListTile(
                    title: Text("Today"),
                    value: "male",
                    groupValue: "male",
                    onChanged: (value) {},
                  ),
                  RadioListTile(
                    title: Text("Yesterday"),
                    value: "male",
                    groupValue: "male",
                    onChanged: (value) {},
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class DialogLayoutWidget extends StatelessWidget {
  final Widget body;
  final bool showCloseButton;
  final String title;

  const DialogLayoutWidget({
    Key? key,
    required this.body,
    this.showCloseButton = true,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: IntrinsicHeight(
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                visible: showCloseButton,
                maintainSize: true,
                maintainAnimation: true,
                maintainInteractivity: false,
                maintainState: true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppTextTheme.of(context).h2Bold,
                    ),
                    RoundMaterialIconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                      contentPadding: const EdgeInsets.all(6),
                      color: AppColors.grayWhite,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              body
            ],
          ),
        ),
      ),
    );
  }
}
