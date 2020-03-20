import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:wande/http/BaseResonse.dart';
import 'package:wande/http/http_config.dart';

class HttpRequest<T> {
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
    quest(await HttpClient().putUrl(getUri(unencodedPath, params)), callBack);
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
    var json = await response.transform(utf8.decoder).join();
    print(json);
  }
}

abstract class HttpRequestCallback<T> {
  void onSuccess(T t);

  void onError(String errCode, String errMsg);
}
