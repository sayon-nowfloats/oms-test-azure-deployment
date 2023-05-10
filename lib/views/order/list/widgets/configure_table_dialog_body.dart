import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oms/generated/assets.dart';
import 'package:oms/shared/widgets/buttons.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/order/list/controllers/order_list_controller.dart';

class ConfigureTableDialogBody extends StatefulWidget {
  const ConfigureTableDialogBody({Key? key}) : super(key: key);

  @override
  State<ConfigureTableDialogBody> createState() =>
      _ConfigureTableDialogBodyState();
}

class _ConfigureTableDialogBodyState extends State<ConfigureTableDialogBody> {
  final OrderListController _orderListController = Get.find();
  List<ConfigItemModel> _list = [];

  @override
  void initState() {
    _list = _orderListController.tableColumns
        .map(
          (e) =>
              ConfigItemModel(title: e.getColumnName(), isActive: e.isEnabled),
        )
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 700,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                style: AppTextTheme.of(context).h5.copyWith(
                      color: AppColors.blue4,
                      fontWeight: FontWeight.w400,
                    ),
                children: [
                  const TextSpan(
                    text: 'Show/hide using & re-arrange (',
                  ),
                  WidgetSpan(
                    baseline: TextBaseline.ideographic,
                    child: SvgPicture.asset(Assets.imagesDrag),
                  ),
                  const TextSpan(
                    text: ') the columns in your orders table',
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ReorderableListView(
                buildDefaultDragHandles: false,
                children: _list
                    .map(
                      (item) => ListTile(
                        contentPadding: EdgeInsets.zero,
                        key: Key("${_list.indexOf(item)}"),
                        title: SizedBox(
                          height: 43,
                          child: Row(
                            children: [
                              Container(
                                width: 43,
                                padding: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                    color: item.isActive
                                        ? AppColors.grayWhite
                                        : AppColors.gray2,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: Center(
                                  child: Text(
                                    "${_list.indexOf(item) + 1}",
                                    style: AppTextTheme.of(context).h5.copyWith(
                                          color: AppColors.blue5,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: AppColors.grayWhite),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    color: item.isActive
                                        ? AppColors.white
                                        : AppColors.gray2,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: [
                                            ReorderableDragStartListener(
                                              index: _list.indexOf(item),
                                              child: SvgPicture.asset(
                                                  Assets.imagesDrag),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              item.title,
                                              style: AppTextTheme.of(context)
                                                  .h5
                                                  .copyWith(
                                                    color: AppColors.blue5,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Switch(
                                        value: item.isActive,
                                        activeColor: AppColors.lightGreen,
                                        onChanged: (bool value) {
                                          _list = _list.map((e) {
                                            if (e == item) {
                                              return e.copyWith(
                                                  isActive: value);
                                            }
                                            return e;
                                          }).toList();
                                          setState(() {});
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onReorder: (int start, int current) {
                  // dragging from top to bottom
                  if (start < current) {
                    int end = current - 1;
                    ConfigItemModel startItem = _list[start];
                    int i = 0;
                    int local = start;
                    do {
                      _list[local] = _list[++local];
                      i++;
                    } while (i < end - start);
                    _list[end] = startItem;
                  }
                  // dragging from bottom to top
                  else if (start > current) {
                    ConfigItemModel startItem = _list[start];
                    for (int i = start; i > current; i--) {
                      _list[i] = _list[i - 1];
                    }
                    _list[current] = startItem;
                  }
                  setState(() {});
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: AppButton(
                      shape: AppButtonShape.roundedRectangle,
                      type: AppButtonType.tertiary,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Reset to default",
                        style: AppTextTheme.of(context).h5.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.blue5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: AppButton(
                      shape: AppButtonShape.roundedRectangle,
                      type: AppButtonType.primary,
                      onPressed: () {
                        List<OrderColumns> tableColumns = _list.map((e) {
                          OrderColumns item = _orderListController.tableColumns
                              .firstWhere((element) =>
                                  element.getColumnName() == e.title);
                          return item.copyWith(isEnabled: e.isActive);
                        }).toList();
                        _orderListController.tableColumns.clear();
                        _orderListController.tableColumns.value = tableColumns;
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Update table",
                        style: AppTextTheme.of(context).h5.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class ConfigItemModel extends Equatable {
  final String title;
  final bool isActive;

  const ConfigItemModel({
    required this.title,
    this.isActive = false,
  });

  ConfigItemModel copyWith({
    String? title,
    bool? isActive,
  }) {
    return ConfigItemModel(
        title: title ?? this.title, isActive: isActive ?? this.isActive);
  }

  @override
  List<Object?> get props => [title, isActive];
}
