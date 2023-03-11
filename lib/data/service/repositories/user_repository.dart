import 'dart:io';

import 'package:ecampus_library/data/models/user_model.dart';
import 'package:ecampus_library/data/service/dao/user_dao.dart';

class UserRepository with UserDao{
  @override
  Future<UserModel> getUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future storeUserInfo(selectedImage, firstName, lastName, email, phone, countryValue, genderValue, classValue, schoolValue, category) {
    // TODO: implement storeUserInfo
    throw UnimplementedError();
  }

  @override
  Future uploadImage({required File image}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
  
}