import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:oms/themes/app_text_theme.dart';

class GroupCheckBox extends StatefulWidget {
  const GroupCheckBox({Key? key}) : super(key: key);

  @override
  State<GroupCheckBox> createState() => _GroupCheckBoxState();
}

class _GroupCheckBoxState extends State<GroupCheckBox> {
  List<CheckBoxItemModel> _items = [];

  @override
  void initState() {
    _items = [
      const CheckBoxItemModel(
        title: "check 1",
      ),
      const CheckBoxItemModel(
        title: "check 2",
      ),
      const CheckBoxItemModel(
        title: "check 3",
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 100),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          CheckBoxItemModel item = _items[index];
          return _checkBoxItem(
              title: item.title,
              value: item.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _items = _items.map((e) {
                    if (_items.indexOf(e) == index) {
                      return item.copyWith(isChecked: !item.isChecked);
                    }
                    return e;
                  }).toList();
                });
              });
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 4,
          );
        },
        itemCount: _items.length,
      ),
    );
  }

  Widget _checkBoxItem(
      {bool value = false,
      String title = "",
      Function(bool? value)? onChanged}) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(
          title,
          style: AppTextTheme.of(context).h5,
        )
      ],
    );
  }
}

class CheckBoxItemModel extends Equatable {
  final bool isChecked;
  final String title;

  const CheckBoxItemModel({
    required this.title,
    this.isChecked = false,
  });

  CheckBoxItemModel copyWith({
    bool? isChecked,
    String? title,
  }) {
    return CheckBoxItemModel(
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  @override
  List<Object?> get props => [isChecked, title];
}
