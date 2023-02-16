import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? category = "ADMIN";
  String? avatarUrl;
  String? level;
  String? school;
  String? country;
  String? gender;

  UserModel({
    this.uid,
    this.firstName,
    this.email,
    this.phone,
    this.avatarUrl,
    this.lastName,
    this.category,
    this.level,
    this.country,
    this.gender,
    this.school,
  });

  

  toJson() {
    return {
      "Uid": uid,
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "Phone": phone,
      "Gender": gender,
      "AvatarUrl": avatarUrl,
      "Category": category,
      "Class": level,
      "School": school,
      "Country": country,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
    uid : document.id,
    firstName : data["FirstName"],
    lastName : data["LastName"],
    email : data["Email"],
    phone : data["Phone"],
    avatarUrl : data["AvatarUrl"],
    category : data["Category"],
    level : data["Level"],
    country : data["Country"],
    gender : data["Gender"],
    school : data["School"],
    );
  }
}

class AuthCredentials {
  final String phone;

  AuthCredentials({required this.phone});
}

enum userCategory { STUDENT, ADMIN, AUTHOR }
