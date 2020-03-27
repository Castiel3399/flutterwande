import 'dart:convert';

import 'package:crypto/crypto.dart';

class TokenFactory {
  /**
   * params 不要含有 token
   */
  static String generateToken(Map<String, String> params, String token) {
    var keys = params.keys;
    var list = keys.toList();
    //加入用户token
    list.add("token");
    //排序
    list.sort();
    String keyValues = "";
    //合并参数
    list.forEach((key) {
      if (key == "token")
        keyValues += ("token" + (token == null ? "" : token));
      else
        keyValues += (key + (params[key] == null ? "" : params[key]));
    });
    //md5 加密
    var md5Data = md5.convert(utf8.encode(keyValues)).toString();
    //截取
    return md5Data.substring(8, 24);
  }
}
