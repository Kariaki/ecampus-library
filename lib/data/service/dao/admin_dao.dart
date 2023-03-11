import '../../models/user_model.dart';
import '../../user_categories.dart';

abstract class AdminDao{


  Future<List<UserModel>> getUserByCategory({required Category category});


  Future assignAdmin({required String uuid});

  Future removeFromAdmin({required String uuid});

}