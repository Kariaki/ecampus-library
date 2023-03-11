import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:ecampus_library/data/service/dao/user_dao.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class UserRepository with UserDao {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore doc = FirebaseFirestore.instance;
  FirebaseStorage store = FirebaseStorage.instance;

  @override
  Future<UserModel> getUserInfo() async {
    String uid = auth.currentUser!.uid;

    // TODO: implement getUserInfo
    try {
      final snapshot =
          await doc.collection("users").where("Uid", isEqualTo: uid).get();
      final userInfo =
          snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
      return userInfo;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future storeUserInfo(selectedImage, firstName, lastName, email, phone,
      countryValue, genderValue, classValue, schoolValue, category) async {
    String url = await uploadImage(image: selectedImage);
    String uid = auth.currentUser!.uid;
    final user = UserModel(
      uid: uid,
      avatarUrl: url,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      category: category,
      country: countryValue,
      level: classValue,
      school: schoolValue,
      gender: genderValue
    ).toJson();

    // TODO: implement storeUserInfo
    try{
      doc.collection("users").doc(uid).set(user);
    }catch (e){
      throw UnimplementedError();
    }
  }

  @override
  Future uploadImage({required File image}) async {
    String imageUrl = "";
    String fileName = Path.basename(image.path);
    final ref = store.ref().child("user/$fileName");

    // TODO: implement uploadImage
    try{
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      await taskSnapshot.ref.getDownloadURL().then((value) {
        imageUrl = value;
      });
    }catch (e){
      throw UnimplementedError();
    }
  }
}
