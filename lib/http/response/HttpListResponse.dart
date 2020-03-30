import 'package:wande/factory/EntityFactory.dart';
import 'package:wande/http/response/HttpBaseResponse.dart';

class HttpListResponse<T> extends HttpBaseResponse {
  List<T> data;

  HttpListResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = EntityFactory.generateOBJList<T>(json["data"]);
  }

  @override
  List<T> getData() {
    return data;
  }
}
