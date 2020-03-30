import 'package:wande/factory/EntityFactory.dart';

import 'HttpBaseResponse.dart';

class HttpNormalResponse<T> extends HttpBaseResponse {
  T data;

  HttpNormalResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    data = EntityFactory.generateOBJ<T>(json["data"]);
  }

  T getData() {
    return data;
  }
}
