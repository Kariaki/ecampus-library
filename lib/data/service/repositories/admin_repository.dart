import 'package:ecampus_library/data/models/user_model.dart';
import 'package:ecampus_library/data/service/dao/admin_dao.dart';
import 'package:ecampus_library/data/user_categories.dart';

class AdminRepository with AdminDao{

  @override
  Future assignAdmin({required String uuid}) {
    // TODO: implement assignAdmin
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUserByCategory({required Category category}) {
    // TODO: implement getUserByCategory
    throw UnimplementedError();
  }

  @override
  Future removeFromAdmin({required String uuid}) {
    // TODO: implement removeFromAdmin
    throw UnimplementedError();
  }

}