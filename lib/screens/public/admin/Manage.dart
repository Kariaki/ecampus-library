import 'package:ecampus_library/screens/public/admin/user/Admin.dart';
import 'package:ecampus_library/screens/public/admin/user/Author.dart';
import 'package:ecampus_library/screens/public/admin/user/User.dart';
import 'package:flutter/material.dart';

class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  List<String> title = ["Admin", "Author", "User"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          TabBar(
            labelColor: Colors.indigo[700],
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                text: "Books",
              ),
              Tab(
                text: "Audiobooks",
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(children: [
              //  Admin
              Admin(),

              //  Author
              Author(),

              // Users
              User(),
            ]),
          ),
        ]),
      )),
    );
  }
}
