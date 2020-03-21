import 'package:wande/bean/user_bean.dart';

class EntityFactory {
  static T generateOBJ<T>(Map<String, dynamic> json) {
    if (T.toString() == "UserBean") {
      return UserBean.fromJson(json) as T;
    }
  }
}
