import 'package:flutter/material.dart';
import 'package:oms/themes/app_colors.dart';

class AppRangeSliderWidget extends StatefulWidget {
  const AppRangeSliderWidget({Key? key}) : super(key: key);

  @override
  State<AppRangeSliderWidget> createState() => _AppRangeSliderWidgetState();
}

class _AppRangeSliderWidgetState extends State<AppRangeSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: AppColors.lightGreen,
          inactiveTrackColor: AppColors.gray2,
          trackShape: const RectangularSliderTrackShape(),
          trackHeight: 9.0,
          thumbColor: Colors.lightGreen,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayColor: AppColors.gray2,
          overlayShape: SliderComponentShape.noThumb
          // overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
          ),
      child: RangeSlider(
        values: _currentRangeValues,
        max: 100,
        divisions: 5,
        activeColor: AppColors.lightGreen,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
          });
        },
      ),
    );
  }
}
