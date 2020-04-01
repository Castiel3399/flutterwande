import 'dart:convert';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/foundation.dart';
import 'package:wande/factory/TokenFactory.dart';
import 'package:wande/http/HttpResultCode.dart';
import 'package:wande/http/response/HttpBaseResponse.dart';
import 'package:wande/http/response/HttpListResponse.dart';
import 'package:wande/http/response/HttpNormalResponse.dart';
import 'package:wande/http/response/HttpPageResponse.dart';
import 'package:wande/utils/ShareUtils.dart';

import 'HttpConfig.dart';
import 'callback/HttpRequestCallback.dart';

class HttpRequest {
  static const REQUEST_TYPE_NORMAL = 1;
  static const REQUEST_TYPE_LIST = 2;
  static const REQUEST_TYPE_PAGE = 3;

  /**
   * get 请求
   */
  void requestGet<K, T>(String unencodedPath,
      HttpRequestCallback<K, T> callback, Map<String, String> params) async {
    addPopParamsAndToken(params);
    quest(await HttpClient().getUrl(getUri(unencodedPath, params)), callback);
  }

  /**
   * post 请求
   */
  void requestPost<K, T>(String unencodedPath,
      HttpRequestCallback<K, T> callback, Map<String, String> params) async {
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
  void quest<K, T>(
      HttpClientRequest request, HttpRequestCallback<K, T> callback) async {
    var response = await request.close();
    var statusCode = response.statusCode;
    if (!kReleaseMode) logRequest(request);
    if (statusCode == 200) {
      var json = await response.transform(utf8.decoder).join();
      if (!kReleaseMode) logResponse(json);
      var jsonObject = jsonDecode(json);

      if (callback != null) {
        var requestType = K.toString().contains("HttpListResponse")
            ? REQUEST_TYPE_LIST
            : (K.toString().contains("HttpPageResponse")
                ? REQUEST_TYPE_PAGE
                : REQUEST_TYPE_NORMAL);

        HttpBaseResponse httpBaseResponse = null;
        if (requestType == REQUEST_TYPE_PAGE) {
          httpBaseResponse = HttpPageResponse<T>.fromJson(jsonObject);
        } else if (requestType == REQUEST_TYPE_LIST) {
          httpBaseResponse = HttpListResponse<T>.fromJson(jsonObject);
        } else if (requestType == REQUEST_TYPE_NORMAL) {
          httpBaseResponse = HttpNormalResponse<T>.fromJson(jsonObject);
        }

        if (httpBaseResponse != null &&
            httpBaseResponse.getResultCode() ==
                HttpResultCode.RESULT_CODE_SUCCESS) {
          if (requestType == REQUEST_TYPE_PAGE) {
            //分页
            callback.onSuccessPage((httpBaseResponse as HttpPageResponse).data);
          } else if (requestType == REQUEST_TYPE_LIST) {
            //集合
            callback.onSuccessList((httpBaseResponse as HttpListResponse).data);
          } else if (requestType == REQUEST_TYPE_NORMAL) {
            //单类
            callback.onSuccess((httpBaseResponse as HttpNormalResponse).data);
          }
        } else {
          callback.onError(
              httpBaseResponse.resultCode, httpBaseResponse.getMsg());
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
    requestParams['token'] =
        TokenFactory.generateToken(requestParams, ShareUtils.token);
  }

  /**
   * 生成公共参数
   */
  generatePopParams() {
    Map<String, String> map = Map();
    map['appType'] = Platform.operatingSystem;
    map['systemVersion'] = Platform.version;
    map['clientVersion'] = "1.0.0";
    map['clientPackage'] = "com.xueduoduo.wande.evaluation";
    map['deviceId'] = ShareUtils.devideId;
    map['accessKey'] = HttpConfig.ACCESS_KEY;
    var dateFormat = formatDate(
        DateTime.now(), [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss]);
    map['rdmTime'] = dateFormat;

    if (ShareUtils.userBean != null) {
      map['operatorId'] = ShareUtils.userBean.userId;
      map['schoolCode'] = ShareUtils.userBean.schoolCode;
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
