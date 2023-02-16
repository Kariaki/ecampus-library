import 'package:ecampus_library/data/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  AuthController authController = Get.find<AuthController>();
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.chevron_left)),

                //  Title
                const Text(
                  "Settings",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),

                // Spacing
                const SizedBox(
                  height: 20,
                ),

                //  Account Settings
                const Text(
                  "Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                SizedBox(
                  height: 20,
                ),

                //  More Options
                const Text("More Options",
                    style: TextStyle(fontWeight: FontWeight.bold)),

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
                      authController.logout();
                    },
                    child: const Text("Sign Out")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
