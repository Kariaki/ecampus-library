import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassTile extends StatelessWidget {
  final String title;
  final ontap;

   ClassTile({Key? key, required this.title, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 120,
                width: Get.width/2,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(0, 5),
                      spreadRadius: 4,
                      color: Colors.grey,
                    )
                  ],
                ),
                child: Text(title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
