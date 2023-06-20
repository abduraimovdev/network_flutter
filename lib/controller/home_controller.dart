import 'package:flutter/material.dart';
import 'package:network_flutter/service/network_service.dart';

class HomeController {
  ///
  TextEditingController urlController = TextEditingController();
  ///
  void Function(void Function() fn) updater;
  ///
  Color mainColor = Colors.green;
  ///
  String? data;
  ///
  String dropdownvalue = 'get';

  // List of items in our dropdown menu
  var items = [
    'get',
    'post',
    'put',
    'delete',
  ];
  ///
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();
  ///
  HomeController(this.updater);

  /// ---------------------------------
  void onChangeValue (String? newValue) {
    updater(() {
      dropdownvalue = newValue!;
    });
  }

  ///
  void getButton() {
    refreshIndicatorKey.currentState!.show();
    switch(dropdownvalue) {
      case "get":{
        getData(urlController.text.trim());
      }
      case "post":{
        getData(urlController.text.trim());
      }
      default: {
        print("No Data");
      }
    }
  }
  ///
  void dispose() {
    urlController.dispose();
  }

  ///
  Future<void> onRefresh() async {
    return await Future.delayed(const Duration(seconds: 2));
  }














  void getData(String api) async {
    try {
      RegExp regex = RegExp(r"(https://)?(.+\.com|.+\.uz|.+\.ru)(.*)");
      String url = regex.firstMatch(api)!.group(2) ?? "";
      String path = regex.firstMatch(api)!.group(3) ?? "";
      NetworkFlutter network = NetworkFlutter(baseUrl: url);
      String? response = await network.GET(path);
      data = response;
      updater(() {});
    }catch(e) {
      print(e);
      return;
    }

  }

  void postData(String api) async {
    try {
      RegExp regex = RegExp(r"(https://)?(.+\.com|.+\.uz|.+\.ru)(.*)");
      String url = regex.firstMatch(api)!.group(2) ?? "";
      String path = regex.firstMatch(api)!.group(3) ?? "";
      NetworkFlutter network = NetworkFlutter(baseUrl: url);
      String? response = await network.POST(path);
      data = response;
      updater(() {});
    }catch(e) {
      print(e);
      return;
    }

  }

}