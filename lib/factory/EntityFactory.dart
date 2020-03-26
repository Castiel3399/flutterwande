import 'package:wande/bean/UserBean.dart';

class EntityFactory {
  static T generateOBJ<T>(dynamic json) {
    if (T.toString() == "UserBean") {
      return UserBean.fromJson(json) as T;
    } else if (T.toString() == "String") {
      return json as T;
    }
  }
}
