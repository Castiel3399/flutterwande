import 'dart:convert';
import 'dart:io';

import 'package:wande/bean/base_json_bean.dart';
import 'package:wande/http/base_resonse.dart';

import 'http_config.dart';

import 'http_request_callback.dart';

class HttpRequest<T extends BaseJsonBean> {
  /**
   * get 请求
   */
  void requestGet(String unencodedPath, HttpRequestCallback<T> callBack,
      [Map<String, String> params]) async {
    quest(await HttpClient().getUrl(getUri(unencodedPath, params)), callBack);
  }

  /**
   * post 请求
   */
  void requestPost(String unencodedPath, HttpRequestCallback<T> callBack,
      [Map<String, String> params]) async {
    quest(await HttpClient().postUrl(getUri(unencodedPath, params)), callBack);
  }

  /**
   * 统一处理
   */
  getUri(String unencodedPath, [Map<String, String> params]) {
    return Uri.http(
        HttpConfig.BASE_URL, HttpConfig.BASE_PROJECT + unencodedPath, params);
  }

  void quest(HttpClientRequest request, HttpRequestCallback<T> callBack) async {
    var response = await request.close();
    var statusCode = response.statusCode;
    if (statusCode == 200) {
      var json = await response.transform(utf8.decoder).join();
      print(json);
      var jsonObject = jsonDecode(json);
      BaseResponse baseResponse = BaseResponse<T>.fromJson(jsonObject);
      if (baseResponse.getSuccess()) {
        callBack.onSuccess(baseResponse.data);
      } else {
        callBack.onError(baseResponse.resultCode, baseResponse.getMsg());
      }
    } else {
      callBack.onError(statusCode, "数据获取异常");
    }
  }
}
