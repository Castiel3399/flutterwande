import 'package:wande/factory/entity_factory.dart';

class BaseResponse<T> {
  bool success;
  String msg;
  String time;
  int resultCode;
  T data;

  getMsg() {
    return msg;
  }

  getRecultCode() {
    return resultCode;
  }

  getSuccess() {
    return success;
  }

  BaseResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    time = json["time"];
    msg = json["msg"];
    data = EntityFactory.generateOBJ<T>(json["data"]);
  }
}
