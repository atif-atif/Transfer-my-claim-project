import 'package:flutter/material.dart';
import 'package:lawyer/utils/colors.dart';

class CustomDropDown extends StatelessWidget {
  var dropDownLabel;
  final String label;
  List<String> items;
  // final homeController = Get.put(HomeController());

  CustomDropDown({
    Key? key,
    required this.label,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropDownLabel,
      isExpanded: true,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(
        label,
        style: TextStyle(
          color: AppColor.black,
        ),
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          dropDownLabel = newValue;
        }
      },
    );
  }
}
