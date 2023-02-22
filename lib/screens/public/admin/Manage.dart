import 'package:ecampus_library/constants/constants.dart';
import 'package:ecampus_library/data/controllers/admin_controller.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:ecampus_library/screens/public/admin/user/Admin.dart';
import 'package:ecampus_library/screens/public/admin/user/Author.dart';
import 'package:ecampus_library/screens/public/admin/user/User.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  List<String> title = ["Admin", "Author", "User"];
  AdminController adminController = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Manage User",
          style: TextStyle(
            color: AppConstants().primary,
          ),
        ),
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left,
            color: AppConstants().primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppConstants().primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.filter_alt,
              color: AppConstants().primary,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<List<UserModel>>(
            future: adminController.getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Row(children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration:  BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.indigo,
                                    image: DecorationImage(image: NetworkImage(snapshot.data![index].avatarUrl!))
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text("${snapshot.data![index].firstName!} ${snapshot.data![index].lastName!}"),
                                    Text(snapshot.data![index].email!)
                                  ],
                                ),
                                
                              ],)
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
