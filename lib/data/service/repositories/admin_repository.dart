import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecampus_library/data/exceptions/app_exceptions.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:ecampus_library/data/service/dao/admin_dao.dart';
import 'package:ecampus_library/data/user_categories.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminRepository with AdminDao {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore doc = FirebaseFirestore.instance;

  @override
  Future assignAdmin({required String uuid}) async {
    final document = doc.collection("users").doc(uuid);
    final snapshot = await document.get();
    final data = snapshot.data();

    if (data != null) {
      data['category'] = Category.ADMIN.name;
      document.update(data);
    }
    throw UserNotFoundException('user not found');
  }

  @override
  Future<List<UserModel>> getUserByCategory(
      {required Category category}) async {
    final query = await doc
        .collection('users')
        .where("category", isEqualTo: category.name)
        .get();
    final result = query.docs.map((e) => UserModel.fromSnapshot(e)).toList();

    return result;
  }

  /*
    TODO IF YOU WANT TO LISTEN FOR CHANGES
    THEN FOLLOW THIS PROCEEDURE AND ALSO ACCEPT A FUNCTION AS PARAMERTER TO COLLECT THE CHANGES
    AS SHOWN BELLOW
     */
  Future tryThis(
      {required Category category,
      required Function(List<UserModel>) callback}) async {
    final query = await doc
        .collection('users')
        .where("category", isEqualTo: category.name)
        .snapshots();
    query.listen((event) {
      final result = event.docs.map((e) => UserModel.fromSnapshot(e)).toList();
      callback(result);
    });
  }

  @override
  Future removeFromAdmin({required String uuid}) async {
    final document = doc.collection("users").doc(uuid);
    final snapshot = await document.get();
    final data = snapshot.data();

    if (data != null) {
      data['category'] = Category.USER.name;
      document.update(data);
    }
    throw UserNotFoundException('user not found');
  }
}
