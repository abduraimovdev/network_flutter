import 'package:flutter/material.dart';
import 'package:network_flutter/controller/home_controller.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.urlController,
      cursorColor: controller.mainColor,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: "https://api.url",
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: controller.mainColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
