import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecampus_library/data/controllers/user_controller.dart';
import 'package:ecampus_library/screens/auth/auth.dart';
import 'package:ecampus_library/screens/auth/edit_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

UserController userController = Get.put(UserController());

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore doc = FirebaseFirestore.instance;
  FirebaseStorage store = FirebaseStorage.instance;

  dynamic credentials;
  var isLoading = false.obs;

  // TODO: CREATE ACCOUNT
  Future createAccount(
    email,
    password,
  ) async {
    print("signup Called");
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (value) {
          isLoading(false);
          getRoute();
        },
      ).catchError((e) {
        isLoading(false);
        throw e;
      });
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      rethrow;
    }
  }

  // TODO: LOG USER IN
 Future login(email, password) async {
    try {
      print("Attempting login");
      await auth.signInWithEmailAndPassword(email: email, password: password).then(
        (user) {
          print("login successful");
          getRoute();
        },
      ).catchError((e) {
        log('In Error $e');
        isLoading(false);
        throw(e.toString());
      });
    } on FirebaseAuthException catch (e) {
       log('In Auth Error $e');
      isLoading(false);
      rethrow;
    }
  }

  // TODO: LOG USER OUT
  logout() {
    auth.signOut();
    Get.to(() => const AuthScreen());
  }

  // TODO: CHANGE USER PASSWORD

  // TODO: GET USER ROUTE(isAdmin or not)
  getRoute() {
    User? user = auth.currentUser;
    if (user != null) {
      doc.collection("users").doc(user.uid).get().then((value) {
        if (value.exists) {
          print("user is logedin");
          userController.getUserByCategory();
        } else {
          Get.to(() => const EditProfileScreen());
        }
      });
    }
  }
}
