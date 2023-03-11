import 'package:ecampus_library/data/user_categories.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * TODO HANDLE SHARED PREFERENCE HERE
 */

const userCategory = 'user-category';

class Preference {

  static void setDownloadStatus(Category category) async {

    final Future<SharedPreferences> _sharedPreference =
    SharedPreferences.getInstance();
    SharedPreferences sharedPreferences = await _sharedPreference;
    await sharedPreferences
        .setString(userCategory, category.name)
        .then((value) => value);
  }


}
