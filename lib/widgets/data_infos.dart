import 'package:flutter/material.dart';
import 'package:network_flutter/controller/home_controller.dart';

class DataInfos extends StatelessWidget {
  const DataInfos({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: controller.mainColor, width: 1),
      ),
      child: SelectableText(
        controller.data ?? "Not Found Data",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
