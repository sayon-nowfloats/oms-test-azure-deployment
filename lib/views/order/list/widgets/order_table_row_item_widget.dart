import 'package:flutter/material.dart';
import 'package:oms/shared/currency/currency_helper.dart';
import 'package:oms/themes/app_colors.dart';
import 'package:oms/themes/app_text_theme.dart';

class OrderTableRowItemWidget extends StatelessWidget {
  const OrderTableRowItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _baseAmountWidget();
  }

  Widget _orderStateWidget({
    String mainText = "",
    String subText = "",
  }) {
    return Builder(builder: (context) {
      return SizedBox(
        height: 32,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: DropdownButton<String>(
                icon: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                  ),
                  height: double.infinity,
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.ac_unit, size: 14),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Received",
                              style: AppTextTheme.of(context).h6,
                            ),
                          ],
                        ),
                        const Icon(Icons.keyboard_arrow_down, size: 14),
                      ],
                    ),
                  ),
                ),
                // isDense: true,
                isExpanded: true,
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
              ),
              padding: EdgeInsets.all(5),
              height: double.infinity,
              child: const Icon(
                Icons.refresh,
                size: 14,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _baseInformationWidget({
    String mainText = "",
    String subText = "",
  }) {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            mainText,
            style: AppTextTheme.of(context).h5,
          ),
          if (subText.isNotEmpty)
            Text(
              subText,
              style: AppTextTheme.of(context).h6,
            ),
        ],
      );
    });
  }

  Widget _baseAmountWidget() {
    return Builder(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            1200.inRupeesFormat(),
            style: AppTextTheme.of(context).h5,
          ),
          Row(
            children: [
              Icon(
                Icons.access_alarm,
                size: 12,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                'prepaid view UPI',
                style: AppTextTheme.of(context).h6,
              ),
            ],
          ),
        ],
      );
    });
  }
}
