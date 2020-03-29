import 'dart:convert';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:wande/factory/TokenFactory.dart';
import 'package:wande/http/BaseResponse.dart';
import 'package:wande/http/HttpRequestCallback.dart';
import 'package:wande/http/HttpResultCode.dart';
import 'package:wande/utils/ShareUtils.dart';

import 'HttpConfig.dart';

class HttpRequest<T> {
  /**
   * get 请求
   */
  void requestGet(String unencodedPath, HttpRequestCallback<T> callback,
      Map<String, String> params) async {
    addPopParamsAndToken(params);
    quest(await HttpClient().getUrl(getUri(unencodedPath, params)), callback);
  }

  /**
   * post 请求
   */
  void requestPost(String unencodedPath, HttpRequestCallback<T> callback,
      Map<String, String> params) async {
    addPopParamsAndToken(params);
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
//    if (!kReleaseMode)
    logRequest(request);
    if (statusCode == 200) {
      var json = await response.transform(utf8.decoder).join();
      var jsonObject = jsonDecode(json);
//      if (!kReleaseMode)
      logResponse(jsonObject);
      BaseResponse baseResponse = BaseResponse<T>.fromJson(jsonObject);
      if (callback != null) {
        if (baseResponse.getResultCode()==HttpResultCode.RESULT_CODE_SUCCESS) {
          callback.onSuccess(baseResponse.data);
        } else {
          callback.onError(baseResponse.resultCode, baseResponse.getMsg());
        }
      }
    } else {
      if (callback != null) callback.onError(statusCode, "数据获取异常");
    }
  }

  /**
   *
   *
   * 添加公共参数
   */
  void addPopParamsAndToken(Map<String, String> requestParams) {
    var popParams = generatePopParams();
    //添加公共参数
    requestParams.addAll(popParams);
    //计算token
    requestParams['token'] = TokenFactory.generateToken(requestParams, ShareUtils.token);
  }

  /**
   * 生成公共参数
   */
  generatePopParams() {
    Map<String, String> map = Map();
    map['appType'] = Platform.operatingSystem;
    map['systemVersion'] = 23.toString();
    map['clientVersion'] = "1.0.0";
    map['clientPackage'] = "com.xueduoduo.wande.evaluation";
    map['deviceId'] = ShareUtils.getDeviceId();
    map['accessKey'] = HttpConfig.ACCESS_KEY;
    var dateFormat = formatDate(
        DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
    map['rdmTime'] = dateFormat;

    var userBean = ShareUtils.getUserBean();
    if (userBean != null) {
      map['operatorId'] = ShareUtils.getUserBean().userId;
      map['schoolCode'] = ShareUtils.getUserBean().schoolCode;
    }
    return map;
  }

  void logRequest(HttpClientRequest request) {
    print("▶ methord: " + request.method);
    print("▶ url: " + request.uri.toString());
  }

  void logResponse(jsonObject) {
    //打印返回json数据
    print(
        "▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼");
    var content = jsonObject.toString();
    var maxLen = 120;
    var lines = content.length / maxLen;

    if (content.length % maxLen != 0) lines++;

    for (int i = 0; i < lines; i++) {
      var startIndex = i * maxLen;
      if (startIndex > content.length) break;
      var endIndex = (i + 1) * maxLen;
      if (endIndex > content.length) {
        endIndex = content.length;
      }
      print("◆ " + content.substring(startIndex, endIndex));
    }

    print(
        "▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲");
  }
}
