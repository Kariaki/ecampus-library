import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AdminController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore doc = FirebaseFirestore.instance;

  var isLoading = false.obs;

  // TODO: Get All Users6c

  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await doc.collection("users").get();
    final userInfo =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    isLoading(false);
    return userInfo;
  }

  // TODO: GET ALL ADMINS
  Future<List<UserModel>> getAllAdmins() async {
    final snapshot = await doc
        .collection("users")
        .where("Category", isEqualTo: userCategory.ADMIN.name)
        .get();
    final userInfo =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    isLoading(false);
    return userInfo;
  }

  // TODO: GET ALL AUTHORS
  Future<List<UserModel>> getAllAuthors() async {
    final snapshot = await doc
        .collection("users")
        .where("Category", isEqualTo: userCategory.AUTHOR.name)
        .get();
    final userInfo =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    isLoading(false);
    return userInfo;
  }

  // TODO: MAKE USER AN ADMIN
  Future makeAdmin(uid) async {
    // await doc.collection("users").doc(uid).update(data);
  }
 
  // TODO: MAKE USER AN AUTHOR
}
