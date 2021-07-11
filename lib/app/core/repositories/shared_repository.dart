import 'package:flutter_auth/app/core/interfaces/shared_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedRepository implements ISharedRepositoryInterface {
  @override
  Future<dynamic> getValue<T>(String key) async {
    return await setInstance().then((sharedPreferences) {
      switch (T) {
        case double:
          return sharedPreferences.getDouble(key);
        case int:
          return sharedPreferences.getInt(key);
        case String:
          return sharedPreferences.getString(key);
        case List:
          return sharedPreferences.getStringList(key);
        case bool:
          return sharedPreferences.getBool(key);
        default:
          return sharedPreferences.getString(key);
      }
    });
  }

  @override
  Future<SharedPreferences> setInstance() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<bool> setValue<T>(String key, dynamic value) async {
    return await setInstance().then((sharedPreferences) {
      switch (T) {
        case double:
          return sharedPreferences.setDouble(key, value);
        case int:
          return sharedPreferences.setInt(key, value);
        case String:
          return sharedPreferences.setString(key, value);
        case List:
          return sharedPreferences.setStringList(key, value);
        case bool:
          return sharedPreferences.setBool(key, value);
        default:
          return sharedPreferences.setString(key, value);
      }
    });
  }
}
