import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget IntroWidget() {
  return Container(
    width: Get.width,
    height: Get.height * 0.5,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/login.jpg"),
        fit: BoxFit.cover,
      )
    ),
  );
}
