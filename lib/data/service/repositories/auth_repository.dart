import 'package:ecampus_library/data/service/dao/auth_dao.dart';

class AuthRepository with AuthDao{
  @override
  Future createAccount({required String email, required String password}) {
    // TODO: implement createAccount
    throw UnimplementedError();
  }

  @override
  Future login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

}