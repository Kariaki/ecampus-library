
abstract class AuthDao{


  Future createAccount({required String email,required String password});

  Future login({required String email,required String password});

  logout();


}