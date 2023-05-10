import 'package:get_storage/get_storage.dart';
import 'package:oms/shared/typedef.dart';

class StorageHelper {
  static final storage = GetStorage();

  static const loginUserData = "userData";
  static const loginTokenData = "token";

  static void setUserData(JSON json) {
    storage.write(loginUserData, json);
  }

  static JSON getUserData(JSON json) {
    return storage.read(loginUserData);
  }

  static void setLoginToken(String? data) {
    storage.write(loginTokenData, data);
  }

  static bool isAuthenticated() {
    return storage.read(loginTokenData) != null;
  }
}
