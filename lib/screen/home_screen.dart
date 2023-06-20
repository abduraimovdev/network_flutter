import 'package:flutter/material.dart';
import 'package:network_flutter/controller/home_controller.dart';
import 'package:network_flutter/widgets/appDropDown.dart';
import 'package:network_flutter/widgets/app_button.dart';
import 'package:network_flutter/widgets/app_input.dart';
import 'package:network_flutter/widgets/data_infos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller;

  @override
  void initState() {
    controller = HomeController(setState);
    super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        key: controller.refreshIndicatorKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 100),
                AppInput(controller: controller),
                AppDropDown(controller: controller),
                AppButton(controller: controller),
                DataInfos(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
