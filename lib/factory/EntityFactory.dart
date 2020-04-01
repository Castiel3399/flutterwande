import 'package:wande/bean/EvaBean.dart';
import 'package:wande/bean/UserBean.dart';

class EntityFactory {
  static T generateOBJ<T>(dynamic json) {
    if (T.toString() == "UserBean") {
      return UserBean.fromJson(json) as T;
    } else if (T.toString() == "String") {
      return json as T;
    } else if (T.toString() == "EvaBean") {
      return EvaBean.fromJson(json) as T;
    }
  }

  static List<T> generateOBJList<T>(dynamic json) {
    if (json == null) return null;
    return (json as List).map((jsonItem) => generateOBJ<T>(jsonItem)).toList();
  }
}
