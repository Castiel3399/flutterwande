import 'package:wande/factory/EntityFactory.dart';

class BaseResponse<T> {
  bool success;
  String msg;
  String time;
  int resultCode;
  T data;

  getMsg() {
    return msg;
  }

  getResultCode() {
    return resultCode;
  }

  getSuccess() {
    return success;
  }

  BaseResponse.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    time = json["time"];
    msg = json["msg"];
    resultCode = json["resultCode"];
    data = EntityFactory.generateOBJ<T>(json["data"]);
  }
}
