import 'dart:developer';

import 'package:ecampus_library/data/controllers/user_controller.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:ecampus_library/widgets/Custom_TextField.dart';
import 'package:ecampus_library/widgets/Dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final List<String> genderItem = ["Male", "Female"];
  final List<String> classItems = ["Primary", "Secondary", "T"];
  final List<String> schoolItem = ["Rsu", "UniPort"];
  final List<String> countryItem = ["Ng", "USA"];

  String? genderValue;
  String? classValue;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width;

    return isDesktop > 600
        ? FutureBuilder(
            future: userController.getUserData(),
            builder: (ct, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel info = snapshot.data as UserModel;
                  return Scaffold(
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.chevron_left),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 210,
                                        width: 210,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 4,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          shape: BoxShape.circle,
                                          color: Colors.indigo[900],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.indigo[700],
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor)),
                                          child: Icon(
                                            Icons.edit,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  CustomTextField(
                                    icon: Icons.person,
                                    HintText: "Username",
                                    color: Colors.indigo,
                                    controller: usernameController,
                                    obscure: false,
                                    type: TextInputType.text,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    icon: Icons.person,
                                    HintText: "Firstname",
                                    color: Colors.indigo,
                                    controller: usernameController,
                                    obscure: false,
                                    type: TextInputType.text,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    icon: Icons.person,
                                    HintText: "Lastname",
                                    color: Colors.indigo,
                                    controller: usernameController,
                                    obscure: false,
                                    type: TextInputType.text,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    icon: Icons.mail,
                                    HintText: "Email@gmail.com",
                                    color: Colors.indigo,
                                    controller: emailController,
                                    obscure: false,
                                    type: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // TODO: Gendre
                                  Dropdown(
                                    hint: const Text(
                                      'Select Your Gender',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    item: genderItem
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {},
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        genderValue = value;
                                      });
                                    },
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  //TODO: Country
                                  Dropdown(
                                    hint: const Text(
                                      'Select Your Country',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    item: schoolItem
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {},
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        classValue = value;
                                      });
                                    },
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  //TODO: School
                                  Dropdown(
                                    hint: const Text(
                                      'Select Your School',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    item: schoolItem
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {},
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        classValue = value;
                                      });
                                    },
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  //TODO: Class
                                  Dropdown(
                                    hint: const Text(
                                      'Select Your Class',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    item: classItems
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {},
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        classValue = value;
                                      });
                                    },
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      fixedSize: const MaterialStatePropertyAll(
                                        Size(400, 50),
                                      ),
                                    ),
                                    child: const Text("Save"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        : FutureBuilder(
            future: userController.getUserData(),
            builder: (ct, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel info = snapshot.data as UserModel;

                  return Scaffold(
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.chevron_left),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 210,
                                        width: 210,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 4,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                          shape: BoxShape.circle,
                                          color: Colors.indigo[900],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.indigo[700],
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor)),
                                          child: Icon(
                                            Icons.edit,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  CustomTextField(
                                    icon: Icons.person,
                                    HintText: "Firstname",
                                    color: Colors.indigo,
                                    controller: TextEditingController(text: info.firstName),
                                    obscure: false,
                                    type: TextInputType.text,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    icon: Icons.person,
                                    HintText: "Lastname",
                                    color: Colors.indigo,
                                    controller: TextEditingController(text: info.lastName),
                                    obscure: false,
                                    type: TextInputType.text,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CustomTextField(
                                    icon: Icons.mail,
                                    HintText: "Email@gmail.com",
                                    color: Colors.indigo,
                                    controller: TextEditingController(text: info.email),
                                    obscure: false,
                                    type: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  // TODO: Gendre
                                  Dropdown(
                                    hint: const Text(
                                      'Select Your Gender',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    item: genderItem
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {},
                                    onChanged: (value) {
                                      log(value);
                                      setState(() {
                                        genderValue = value;
                                      });
                                    },
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  //TODO: Country
                                  Dropdown(
                                    hint: const Text(
                                      'Select Your Country',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    item: schoolItem
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {},
                                    onChanged: (value) {
                                      log(value);
                                      setState(() {
                                        classValue = value;
                                      });
                                    },
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  //TODO: School
                                  Dropdown(
                                    hint: const Text(
                                      'Select Your School',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    item: schoolItem
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {},
                                    onChanged: (value) {
                                      log(value);
                                      setState(() {
                                        classValue = value;
                                      });
                                    },
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  //TODO: Class
                                  Dropdown(
                                    hint: const Text(
                                      'Select Your Class',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    item: classItems
                                        .map((item) => DropdownMenuItem(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {},
                                    onChanged: (value) {
                                      log(value);
                                      setState(() {
                                        classValue = value;
                                      });
                                    },
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      fixedSize: const MaterialStatePropertyAll(
                                        Size(400, 50),
                                      ),
                                    ),
                                    child: const Text("Save"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );
  }
}
