import 'package:ecampus_library/data/controllers/auth_controller.dart';
import 'package:ecampus_library/data/controllers/user_controller.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:ecampus_library/screens/public/user/edit_profile.dart';
import 'package:flutter/material.dart';

import 'package:ecampus_library/widgets/CustomStatsTile.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final controller = Get.find<AuthController>();
  final userController = Get.put(UserController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: FutureBuilder(
              future: userController.getUserInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;
                    return Column(
                      children: [
                        // Custom AppBar
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Actions
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const EditProfileScreen()));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.indigo[700],
                                      )),
                            ),

                            //  Avatar And Name
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Avatar
                                  userData.avatarUrl == null ? Container(
                                    height: 110,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 4,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      shape: BoxShape.circle,
                                      color: Colors.indigo[900],
                                    ),
                                    child: const Center(child: Icon(Icons.camera_enhance, color: Colors.white,),),
                                  )
                                  :
                                  Container(
                                    height: 110,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 4,
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                      ),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(image: NetworkImage(userData.avatarUrl.toString()), fit: BoxFit.cover)
                                    ),
                                  ),
                                  

                                  //  Spacing
                                  const SizedBox(
                                    width: 10,
                                  ),

                                  //  Name
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${userData.firstName} ${userData.lastName}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo[700],
                                        ),
                                      ),
                                      Text(
                                        "${userData.email}",
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            // Spacing
                            const SizedBox(
                              height: 10,
                            ),

                            //  Stats
                            SizedBox(
                              height: 60,
                              child: Center(
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: const [
                                    CustomStatsTile(
                                        Label: "Favourite", Score: "53"),
                                    CustomStatsTile(
                                        Label: "Following", Score: "37"),
                                    CustomStatsTile(
                                        Label: "Finished Books", Score: "46"),
                                    CustomStatsTile(
                                        Label: "Finished Audio Books",
                                        Score: "46"),
                                  ],
                                ),
                              ),
                            ),

                            // 
                            // Spacing
                const SizedBox(
                  height: 20,
                ),

                //  Account Settings
                Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo[700]),
                ),
                const ListTile(
                  leading: Icon(Icons.lock),
                  title: Text("Change Password"),
                  trailing: Icon(Icons.chevron_right),
                ),

                // Divider
                const Divider(),

                const ListTile(
                  leading: Icon(Icons.notifications),
                  title: Text("Notification"),
                  trailing: Icon(Icons.chevron_right),
                ),

                // Divider
                const Divider(),

                const ListTile(
                  leading: Icon(Icons.wallet),
                  title: Text("Subscription Settings"),
                  trailing: Icon(Icons.chevron_right),
                ),

                // Divider
                const Divider(),

                const ListTile(
                  leading: Icon(Icons.front_hand),
                  title: Text("Privacy Settings"),
                  trailing: Icon(Icons.chevron_right),
                ),

                // Divider
                const Divider(
                  height: 2,
                ),

                // Spacing
                const SizedBox(
                  height: 20,
                ),

                //  More Options
                Text("More Options",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo[700])),

                const ListTile(
                  title: Text("Newsletter"),
                  trailing: Icon(Icons.chevron_right),
                ),

                // Divider
                const Divider(
                  height: 2,
                ),

                const ListTile(
                  title: Text("Linked Account"),
                  trailing: Icon(Icons.chevron_right),
                ),

                // Divider
                const Divider(
                  height: 2,
                ),

                ElevatedButton(
                    onPressed: () {
                      controller.logout();
                    },
                    child: const Text("Sign Out")),
                          ],
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    Get.snackbar("Opps!", snapshot.error.toString());
                  } else {
                    Get.snackbar("Error", "Something went wrong");
                  }
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
