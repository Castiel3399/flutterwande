abstract class HttpBaseResponse {
  bool success;
  String msg;
  String time;
  int resultCode;


  getMsg() {
    return msg;
  }

  getResultCode() {
    return resultCode;
  }

  getSuccess() {
    return success;
  }

  HttpBaseResponse.fromJson(dynamic json) {
    success = json["success"];
    msg = json["msg"];
    time = json["time"];
    resultCode = json["resultCode"];
  }
}
