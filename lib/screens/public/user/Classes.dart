import "package:ecampus_library/screens/public/user/Classes_screens/E-books.dart";
import "package:ecampus_library/widgets/AudioBooksTile.dart";
import "package:ecampus_library/widgets/ClassTiles.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class ClassScreen extends StatefulWidget {
  const ClassScreen({Key? key}) : super(key: key);

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  List<String> titles = ["Exam", "Videos", "E-books", "Daily Tasks"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 100,
                ),
                children: [
                  ClassTile(
                    title: "E-Books",
                    ontap: () {
                      Get.to(() => const EBooks());
                    },
                  ),
                  ClassTile(title: "Exam", ontap: () {
                      Get.to(() => const EBooks());
                    },),
                  ClassTile(title: "Video",ontap: () {
                      Get.to(() => const EBooks());
                    },),
                  ClassTile(title: "Currculum", ontap: () {
                      Get.to(() => const EBooks());
                    },),
                  ClassTile(title: "Games", ontap: () {
                      Get.to(() => const EBooks());
                    },),
                  ClassTile(title: "Daily Tasks", ontap: () {
                      Get.to(() => const EBooks());
                    },),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
