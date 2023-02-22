import "package:ecampus_library/constants/constants.dart";
import "package:ecampus_library/screens/public/admin/classes_screen/E-books.dart";
import "package:ecampus_library/widgets/ClassTiles.dart";
import "package:ecampus_library/widgets/Drawer.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class ClassScreen extends StatefulWidget {
  const ClassScreen({Key? key}) : super(key: key);

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: Text(AppConstants().appBarTitle,)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children:  [
                    const SizedBox(height: 20,),

                    // Avatar
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        color: Colors.indigo,
                        shape: BoxShape.circle
                      ),
                    ),

                    const SizedBox(width: 10,),

                    // Name
                     const Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 150,
                  ),
                  children: [
                    ClassTile(
                      title: "E-Books",
                      ontap: () {
                        Get.to(() => const EBooks());
                      },
                    ),
                    ClassTile(
                      title: "Exam",
                      ontap: () {
                        Get.to(() => const EBooks());
                      },
                    ),
                    ClassTile(
                      title: "Video",
                      ontap: () {
                        Get.to(() => const EBooks());
                      },
                    ),
                    ClassTile(
                      title: "Currculum",
                      ontap: () {
                        Get.to(() => const EBooks());
                      },
                    ),
                    ClassTile(
                      title: "Games",
                      ontap: () {
                        Get.to(() => const EBooks());
                      },
                    ),
                    ClassTile(
                      title: "Daily Tasks",
                      ontap: () {
                        Get.to(() => const EBooks());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
