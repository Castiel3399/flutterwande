import 'package:wande/bean/base_json_bean.dart';
import 'package:wande/factory/entity_factory.dart';

class BaseResponse<T extends BaseJsonBean> extends BaseJsonBean {
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
    data = EntityFactory.generateOBJ(json["data"]);
  }
}
