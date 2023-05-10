import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oms/shared/widgets/app_bar_widget.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';
import 'package:oms/views/order/list/controllers/order_list_controller.dart';
import 'package:oms/views/order/list/widgets/order_table_row_item_widget.dart';
import 'package:oms/views/order/list/widgets/top_order_search_widget.dart';

class OrderListPage extends StatelessWidget {
  OrderListPage({Key? key}) : super(key: key);

  final OrderListController _orderListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSizeWidgetWrapper(
        child: const AppBarWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            const TopOrderSearchWidget(),
            const SizedBox(height: 10),
            // _tableView()
            Row(
              children: _orderListController.orderStates
                  .map(
                    (item) => Obx(
                      () => IntrinsicWidth(
                        child: _stateItemWidget(
                          text: item.getStateName(),
                          count: item.count,
                          isSelected: item ==
                              _orderListController.selectedOrderState.value,
                          onTap: () {
                            _orderListController.selectedOrderState.value =
                                item;
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  RoundedRectangaleButton(
                    buttonText: "Create shipping batch",
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  PopMenuButton(
                    menuItems: [
                      "Add to Shipping Batch",
                      "Download Invoice",
                      "Update Orders"
                    ],
                    buttonText: "More actions",
                    onSelected: (String data) {},
                  ),
                  const SizedBox(width: 8),
                  PopMenuButton(
                    menuItems: ["teas", "asd", "asd"],
                    buttonText: "For selected",
                    onSelected: (String data) {},
                  ),
                  const SizedBox(width: 8),
                  PopMenuButton(
                    menuItems: ["teas", "asd", "asd"],
                    buttonText: "Mark as...",
                    onSelected: (String data) {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: _dataTableView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stateItemWidget({
    String text = "",
    int? count,
    bool isSelected = true,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text(text),
                Visibility(
                  visible: count != null,
                  child: Text("${count ?? 0}"),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Container(
              height: 3,
              width: double.infinity,
              color: isSelected ? AppColors.lightGreen : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataTableView() {
    return Obx(
      () => DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        showCheckboxColumn: true,
        // border: TableBorder(
        //   top: const BorderSide(color: Colors.black),
        //   bottom: BorderSide(color: Colors.grey[300]!),
        //   left: BorderSide(color: Colors.grey[300]!),
        //   right: BorderSide(color: Colors.grey[300]!),
        //   verticalInside: BorderSide(color: Colors.grey[300]!),
        //   horizontalInside: const BorderSide(color: Colors.grey, width: 1),
        // ),
        dividerThickness: 1,
        // this one will be ignored if [border] is set above
        bottomMargin: 10,
        minWidth: 900,
        // sortColumnIndex: _sortColumnIndex,
        // sortAscending: _sortAscending,
        sortArrowIcon: Icons.keyboard_arrow_up,
        // custom arrow
        sortArrowAnimationDuration: const Duration(milliseconds: 500),
        // custom animation duration
        onSelectAll: (val) => () {},
        columns: _orderListController.tableColumns
            .where((e) => e.isEnabled)
            .map(
              (element) => DataColumn2(
                label: _cellHeaderItemWidget(element.getColumnName()),
                size: ColumnSize.S,
              ),
            )
            .toList(),
        empty: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.grey[200],
            child: const Text('No data'),
          ),
        ),
        rows: List<DataRow>.generate(
          100,
          (index) => DataRow2(
            onSelectChanged: (bool? s) {},
            cells: List<DataCell>.generate(
              _orderListController.tableColumns
                  .where((e) => e.isEnabled)
                  .length,
              (index) => const DataCell(
                OrderTableRowItemWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cellHeaderItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  Widget _headerDataCell(String filedName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(filedName),
    );
  }
}

class PopMenuButton extends StatelessWidget {
  const PopMenuButton({
    Key? key,
    this.menuItems = const [],
    this.buttonText = "",
    this.onSelected,
  }) : super(key: key);

  final List<String> menuItems;
  final String buttonText;
  final Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue: null,
      offset: const Offset(0, 50),
      onSelected: onSelected,
      itemBuilder: (BuildContext context) => menuItems
          .map(
            (e) => PopupMenuItem<String>(value: e, child: Text(e)),
          )
          .toList(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: AppColors.blue5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: Row(
          children: [
            Text(
              buttonText,
              style: AppTextTheme.of(context)
                  .h6
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}

class RoundedRectangaleButton extends StatelessWidget {
  const RoundedRectangaleButton({Key? key, this.onTap, this.buttonText = ""})
      : super(key: key);

  final VoidCallback? onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: AppColors.blue5),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Text(
          buttonText,
          style:
              AppTextTheme.of(context).h6.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
