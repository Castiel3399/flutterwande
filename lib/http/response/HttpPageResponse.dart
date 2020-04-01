import 'package:wande/http/response/BasePageBean.dart';
import 'package:wande/http/response/HttpBaseResponse.dart';

class HttpPageResponse<T> extends HttpBaseResponse {
  BasePageBean<T> data;

  HttpPageResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = BasePageBean.fromJson(json["data"]);
  }

  BasePageBean<T> getData() {
    return data;
  }
}
