import 'package:ecampus_library/data/requests/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EBooks extends StatefulWidget {
  const EBooks({super.key});

  @override
  State<EBooks> createState() => _EBooksState();
}

class _EBooksState extends State<EBooks> {
  HttpRequest httpRequest = Get.put(HttpRequest());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: ElevatedButton(
                onPressed: () {
                  httpRequest.getBrainFriendData();
                },
                child: const Text("fetch")),
          ),
        ),
      ),
    );
  }
}
