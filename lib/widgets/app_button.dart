import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_flutter/controller/home_controller.dart';



class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: controller.getButton,
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: controller.mainColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          "Get Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}