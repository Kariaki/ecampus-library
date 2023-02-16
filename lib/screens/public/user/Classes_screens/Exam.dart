import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Exams extends StatefulWidget {
  const Exams({super.key});

  @override
  State<Exams> createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Center(child: ElevatedButton(onPressed: (){}, child: Text("Start Exam")),),
        ),
      ),
    );
  }
}