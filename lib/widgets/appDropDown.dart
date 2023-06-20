import 'package:flutter/material.dart';
import 'package:network_flutter/controller/home_controller.dart';
class AppDropDown extends StatelessWidget {
  final HomeController controller;
  const AppDropDown({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
      dropdownColor: controller.mainColor,
      // Initial Value
      value: controller.dropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: controller.items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: controller.onChangeValue,
    );
  }
}
