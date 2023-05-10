import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oms/generated/assets.dart';
import 'package:oms/shared/widgets/app_input_field.dart';
import 'package:oms/shared/widgets/buttons.dart';
import 'package:oms/shared/widgets/dialogs/app_dialogs.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/order/list/widgets/configure_table_dialog_body.dart';
import 'package:oms/views/order/list/widgets/filter_dialog_body_widget.dart';

class TopOrderSearchWidget extends StatelessWidget {
  const TopOrderSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Orders",
              style:
                  AppTextTheme.of(context).h3.copyWith(color: AppColors.blue3),
            ),
            const SizedBox(width: 10),
            Text(
              "(200)",
              style:
                  AppTextTheme.of(context).h5.copyWith(color: AppColors.blue5),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width * .3,
              child: const AppInputField(
                labelText: "Search order",
                hintText: "Search order",
              ),
            ),
            const SizedBox(width: 10),
            AppRoundedButton(
              type: AppButtonType.tertiary,
              onPressed: () {
                AppDialogs.showCustomDialog(
                  context: context,
                  title: "Filter",
                  widget: const FilterDialogBodyWidget(),
                );
              },
              child: Row(
                children: const [
                  Icon(Icons.filter_alt_outlined),
                  Text("Filter"),
                ],
              ),
            ),
            const SizedBox(width: 10),
            PopupMenuButton<PopMenuItem>(
              initialValue: null,
              offset: const Offset(0, 50),
              onSelected: (PopMenuItem item) => item.onTap(context),
              itemBuilder: (BuildContext context) => _popMenuItems
                  .map(
                    (e) => PopupMenuItem<PopMenuItem>(
                      value: e,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            e.iconPath,
                            width: 17,
                            height: 17,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            e.title,
                            style: AppTextTheme.of(context)
                                .h6
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.blue3, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(6),
                child: const Icon(Icons.more_vert),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

List<PopMenuItem> _popMenuItems = [
  PopMenuItem(
    title: "Export",
    type: PopMenuItemsEnum.export,
    iconPath: Assets.imagesDocument,
  ),
  PopMenuItem(
    title: "Import",
    type: PopMenuItemsEnum.import,
    iconPath: Assets.imagesDocument,
  ),
  PopMenuItem(
    title: "View archived order",
    type: PopMenuItemsEnum.viewArchivedOrder,
    iconPath: Assets.imagesDocumentUpload,
  ),
  PopMenuItem(
    title: "Configure table",
    type: PopMenuItemsEnum.configTable,
    iconPath: Assets.imagesSettings,
  ),
];

class PopMenuItem {
  final String title;
  final PopMenuItemsEnum type;
  final String iconPath;

  PopMenuItem({
    this.title = "",
    this.iconPath = "",
    this.type = PopMenuItemsEnum.none,
  });

  void onTap(BuildContext context) {
    switch (type) {
      case PopMenuItemsEnum.export:
        {}
        break;
      case PopMenuItemsEnum.import:
        {}
        break;
      case PopMenuItemsEnum.viewArchivedOrder:
        {}
        break;
      case PopMenuItemsEnum.configTable:
        {
          AppDialogs.showCustomDialog(
            context: context,
            title: "Configure table",
            widget: const ConfigureTableDialogBody(),
          );
        }
        break;
      case PopMenuItemsEnum.none:
        break;
    }
  }
}

enum PopMenuItemsEnum { export, import, viewArchivedOrder, configTable, none }
