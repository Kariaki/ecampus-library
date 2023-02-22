import 'package:ecampus_library/data/controllers/user_controller.dart';
import 'package:ecampus_library/screens/public/admin/Books.dart';
import 'package:ecampus_library/screens/public/admin/Classes.dart';
import 'package:ecampus_library/screens/public/admin/Library.dart';
import 'package:ecampus_library/screens/public/admin/Account.dart';
import 'package:ecampus_library/screens/public/admin/Browse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.indigo,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                //  Avatar
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.indigo[900],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.camera_enhance,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("data"),
                SizedBox(
                  height: 20,
                ),
                Text("data"),
                Divider(),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    Get.to(() => const Browsescreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.auto_stories_outlined),
                  title: const Text("Book"),
                  onTap: () {
                    Get.to(() => const BooksScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.group_outlined),
                  title: const Text("Class"),
                  onTap: () {
                    Get.to(() => const ClassScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.local_library_outlined),
                  title: const Text("Library"),
                  onTap: () {
                    Get.to(() => const MyLibraryScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person_outline_outlined),
                  title: const Text("Account"),
                  onTap: () {
                    Get.to(() => const AccountScreen());
                  },
                ),
                Divider(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
