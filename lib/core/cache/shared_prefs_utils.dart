import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static late SharedPreferences sharedPrefs;

  static init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  //todo: write data
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is int) {
      return await sharedPrefs.setInt(key, value);
    } else if (value is double) {
      return await sharedPrefs.setDouble(key, value);
    } else if (value is String) {
      return await sharedPrefs.setString(key, value);
    } else {
      return await sharedPrefs.setDouble(key, value);
    }
  }

  //todo: read data
  static Object? getData({required String key}) {
    return sharedPrefs.get(key);
  }
}
