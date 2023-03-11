import 'dart:io';
import 'package:ecampus_library/data/controllers/auth_controller.dart';
import 'package:ecampus_library/screens/public/admin/admin_root.dart';
import 'package:ecampus_library/screens/public/author/author_root.dart';
import 'package:ecampus_library/screens/public/user/user_root.dart';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

AuthController authController = Get.find<AuthController>();


class UserController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore doc = FirebaseFirestore.instance;
  FirebaseStorage store = FirebaseStorage.instance;

  dynamic credentials;

  var isProfileUploading = false.obs;

  uploadImage(File image) async {
    String imageUrl = "";
    String fileName = Path.basename(image.path);
    final ref = FirebaseStorage.instance.ref().child("user/$fileName");
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then(
      (value) {
        imageUrl = value;
        print("Download Url: $value");
      },
    );

    return imageUrl;
  }

  // TODO: Store User Infomation
  storeUserInfo(
    selectedImage,
    firstName,
    lastName,
    email,
    phone,
    countryValue,
    genderValue,
    classValue,
    schoolValue,
    category,
  ) async {
    String url = await uploadImage(selectedImage);
    String uid = auth.currentUser!.uid;
    final user = UserModel(
      uid: uid,
      avatarUrl: url,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      country: countryValue,
      gender: genderValue,
      level: classValue,
      school: schoolValue,
      category: category,
    ).toJson();
    doc.collection("users").doc(uid).set(user).then((value) {
      isProfileUploading(false);
      print("done");
      getUserByCategory();
    });
  }

  // TODO: Get User Infomation
  Future<UserModel> getUserInfo() async {
    String uid = auth.currentUser!.uid;
    final snapshot =
        await doc.collection("users").where("Uid", isEqualTo: uid).get();
    final userInfo = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userInfo;
  }

  getUserData() {
    String uid = auth.currentUser!.uid;
    if (uid.isNotEmpty) {
      return getUserInfo();
    } else {
      Get.snackbar("Error", "Something Went Wrong",
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  getUserByCategory() async {
    print("Fetching Category");
    String uid = auth.currentUser!.uid;
    await doc.collection("users").doc(uid).snapshots().listen((event) {
      final data = event.data()!;
      print(data.containsValue("STUDENT"));
      if (data.containsValue("ADMIN")) {
        print("Admin");
        Get.to(() => const AdminRoot());
      } else if (data.containsValue("STUDENT")) {
        print("user");
        Get.to(() => const UserRoot());
      } else if (data.containsValue("AUTHOR")) {
        print("Author");
        Get.to(() => const AuthorRoot());
      } else {
        print("Cannot Find user Category");
      }
    });
  }


}
