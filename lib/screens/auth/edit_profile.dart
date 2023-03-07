import 'dart:io';

import 'package:ecampus_library/data/controllers/auth_controller.dart';
import 'package:ecampus_library/data/controllers/user_controller.dart';
import 'package:ecampus_library/data/dummydata.dart';
import 'package:ecampus_library/widgets/Custom_TextField.dart';
import 'package:ecampus_library/Widgets/Dropdown.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final List<String> genderItem = ["Male", "Female"];
  final List<String> classItems = ["Primary - Jamb", "Tertiary"];
  final List<String> countryItem = ["Ng", "USA"];

  String? genderValue;
  String? classValue;
  String? countryValue;
  String? schoolValue;
  bool isLoading = false;
  bool isVisible = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  AuthController authController = Get.find<AuthController>();
  UserController userController = Get.put(UserController());

  final ImagePicker picker = ImagePicker();
  File? selectedImage;

  getImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => userController.isProfileUploading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TODO: Back Button
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.chevron_left),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            // TODO: Profile Image
                            Stack(
                              children: [
                                if (selectedImage == null)
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
                                  )
                                else
                                  Container(
                                    height: 180,
                                    width: 180,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 4,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: FileImage(selectedImage!),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.indigo[700],
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 2,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          getImage(ImageSource.gallery);
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),

                            // TODO: First Name
                            CustomTextField(
                              icon: Icons.person,
                              HintText: "Firstname",
                              color: Colors.indigo,
                              controller: firstNameController,
                              obscure: false,
                              type: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // TODO: Last Name
                            CustomTextField(
                              icon: Icons.person,
                              HintText: "Lastname",
                              color: Colors.indigo,
                              controller: lastNameController,
                              obscure: false,
                              type: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // TODO: Mobile Number
                            CustomTextField(
                              icon: Icons.phone,
                              HintText: "Mobile Number",
                              color: Colors.indigo,
                              controller: phoneController,
                              obscure: false,
                              type: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // TODO: Email
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

                            // TODO: Gender
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
                              item: countryItem
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
                                  countryValue = value;
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
                                if (value == classItems[1]) {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            //TODO: School
                            Visibility(
                              visible: isVisible,
                              child: Dropdown(
                                hint: const Text(
                                  'Select Your School',
                                  style: TextStyle(fontSize: 14),
                                ),
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black45,
                                ),
                                item: schoolList
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
                                    schoolValue = value;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // TODO: Save Button
                            ElevatedButton(
                              onPressed: () {
                                userController.isProfileUploading(true);
                                userController.storeUserInfo(
                                  selectedImage!,
                                  firstNameController.text.trim(),
                                  lastNameController.text.trim(),
                                  emailController.text.trim(),
                                  phoneController.text.trim(),
                                  countryValue,
                                  genderValue,
                                  classValue,
                                  schoolValue,
                                  userCategory.STUDENT.name,
                                );
                              },
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                fixedSize: const MaterialStatePropertyAll(
                                  Size(400, 50),
                                ),
                              ),
                              child: const Text("Save"),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
