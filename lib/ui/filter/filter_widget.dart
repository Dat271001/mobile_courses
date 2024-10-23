import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.value,
    required this.text,
    required this.groupValue,
    this.onChanged,
  });

  //value: Giá trị của Filter (Flutter, iOS...)
  final int value;
  final String text;
  //groupValue: Giá trị nhóm cho mỗi RadioButton
  final int groupValue;
  //onChanged: Sẽ kích hoạt khi người dùng thực hiện một lựa chọn từ GroupRadioButton
  final ValueChanged<int?>? onChanged;

  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     Radio(
    //       value: value,
    //       groupValue: groupValue,
    //       onChanged: onChanged,
    //     ),
    //     Text(
    //       text,
    //       style: const TextStyle(fontSize: 16),
    //     ),
    //   ],
    // );
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      //onChanged nếu ko được truyền vào hoặc truyền null => Disable radio
      onChanged: onChanged,
      title: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
