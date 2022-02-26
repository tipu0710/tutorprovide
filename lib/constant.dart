import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constant {
  static Future<bool> onBackPressed() async {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return true;
  }

  static Widget appBar(String title, context) {
    return AppBar(
      backgroundColor: Colors.green,
      centerTitle: true,
      title: Text(title),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
    );
  }
}
