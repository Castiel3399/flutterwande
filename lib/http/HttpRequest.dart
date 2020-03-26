import 'dart:convert';
import 'dart:io';

import 'package:wande/http/BaseResponse.dart';
import 'package:wande/http/HttpRequestCallback.dart';

import 'HttpConfig.dart';

class HttpRequest<T> {
  /**
   * get 请求
   */
  void requestGet(String unencodedPath, HttpRequestCallback<T> callback,
      [Map<String, String> params]) async {
    quest(await HttpClient().getUrl(getUri(unencodedPath, params)), callback);
  }

  /**
   * post 请求
   */
  void requestPost(String unencodedPath, HttpRequestCallback<T> callback,
      [Map<String, String> params]) async {
    quest(await HttpClient().postUrl(getUri(unencodedPath, params)), callback);
  }

  /**
   * 统一处理
   */
  getUri(String unencodedPath, [Map<String, String> params]) {
    return Uri.http(
        HttpConfig.BASE_URL, HttpConfig.BASE_PROJECT + unencodedPath, params);
  }

  /**
   * 返回处理
   */
  void quest(HttpClientRequest request, HttpRequestCallback<T> callback) async {
    var response = await request.close();
    var statusCode = response.statusCode;
    if (statusCode == 200) {
      var json = await response.transform(utf8.decoder).join();
      //打印返回json数据
      print(json);
      var jsonObject = jsonDecode(json);
      BaseResponse baseResponse = BaseResponse<T>.fromJson(jsonObject);
      if (callback != null) {
        if (baseResponse.getSuccess()) {
          callback.onSuccess(baseResponse.data);
        } else {
          callback.onError(baseResponse.resultCode, baseResponse.getMsg());
        }
      }
    } else {
      if (callback != null) callback.onError(statusCode, "数据获取异常");
    }
  }
}
