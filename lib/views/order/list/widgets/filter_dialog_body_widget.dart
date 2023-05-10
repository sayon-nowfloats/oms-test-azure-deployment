import 'package:flutter/material.dart';
import 'package:oms/shared/widgets/app_input_field.dart';
import 'package:oms/shared/widgets/app_range_slider_widget.dart';
import 'package:oms/shared/widgets/buttons.dart';
import 'package:oms/shared/widgets/group_check_box.dart';
import 'package:oms/shared/widgets/radio/radio_button_builder.dart';
import 'package:oms/shared/widgets/radio/radio_group.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

class FilterDialogBodyWidget extends StatefulWidget {
  const FilterDialogBodyWidget({Key? key}) : super(key: key);

  @override
  State<FilterDialogBodyWidget> createState() => _FilterDialogBodyWidgetState();
}

class _FilterDialogBodyWidgetState extends State<FilterDialogBodyWidget> {
  String _verticalGroupValue = "Life time";
  final _status = [
    "Life time",
    "Today",
    "Yesterday",
    "Last 7 days",
    "Last 30 days",
    "Custom date range",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 700,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return _radioButtonGroup(title: "Show order from list");
                } else if (index == 1) {
                  return _rangeSliderWidget(title: "Price Range");
                } else if (index == 2) {
                  return _rangeDatePickerWidget(title: "Placed on");
                } else if (index == 3) {
                  return _searchFieldWidget(title: "Pickup location");
                } else if (index == 4) {
                  return _searchFieldWidget(title: "Invoice number");
                } else if (index == 5) {
                  return _searchFieldWidget(title: "Source/ID");
                } else if (index == 6) {
                  return _searchFieldWidget(title: "City");
                } else if (index == 7) {
                  return _searchFieldWidget(title: "Customer name");
                }

                return _dropDownWidget(title: "Order status");
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 15),
              itemCount: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  shape: AppButtonShape.roundedRectangle,
                  type: AppButtonType.tertiary,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"),
                ),
                const SizedBox(
                  width: 10,
                ),
                AppButton(
                  shape: AppButtonShape.roundedRectangle,
                  type: AppButtonType.primary,
                  onPressed: () {},
                  child: const Text("Apply"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _rangeDatePickerWidget({
    String title = "",
  }) {
    return TitleWrapperWidget(
      title: title,
      body: InkWell(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.blue5),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Please select a date",
                style: AppTextTheme.of(context)
                    .h5
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              const Icon(Icons.calendar_today_outlined),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchFieldWidget({
    String title = "",
  }) {
    return TitleWrapperWidget(
      title: title,
      body: Column(
        children: [
          const AppInputField(
            labelText: "Search order",
            hintText: "Search order",
            prefixIcon: Icon(Icons.search),
          ),
          const SizedBox(
            height: 4,
          ),
          GroupCheckBox()
        ],
      ),
    );
  }

  Widget _rangeSliderWidget({
    String title = "",
  }) {
    return TitleWrapperWidget(
      title: title,
      body: const AppRangeSliderWidget(),
    );
  }

  Widget _dropDownWidget({
    String title = "",
  }) {
    return TitleWrapperWidget(
      title: title,
      body: Container(
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        child: DropdownButton<String>(
          borderRadius: const BorderRadius.all(Radius.circular(1.0)),
          underline: const SizedBox(),
          // isDense: true,
          icon: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("All"),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
          items: <String>['A', 'B', 'C', 'D'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }

  Widget _radioButtonGroup({
    String title = "",
  }) {
    return TitleWrapperWidget(
      title: title,
      body: RadioGroup<String>.builder(
        groupValue: _verticalGroupValue,
        onChanged: (value) => setState(() {
          _verticalGroupValue = value ?? '';
        }),
        items: _status,
        itemBuilder: (item) => RadioButtonBuilder(
          item,
        ),
        fillColor: AppColors.lightGreen,
      ),
    );
  }
}

class TitleWrapperWidget extends StatelessWidget {
  const TitleWrapperWidget({
    Key? key,
    this.title = "",
    this.body = const SizedBox(),
  }) : super(key: key);

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextTheme.of(context).h5,
        ),
        const SizedBox(height: 8),
        body
      ],
    );
  }
}
