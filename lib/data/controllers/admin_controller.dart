import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AdminController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore doc = FirebaseFirestore.instance;

  // TODO: Get All Users6c





  
  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await doc.collection("users").get();
    final userInfo =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userInfo;
  }

  // TODO: GET ALL ADMINS


  // TODO: GET ALL AUTHORS


  // TODO: MAKE USER AN ADMIN


  // TODO: MAKE USER AN AUTHOR
}
