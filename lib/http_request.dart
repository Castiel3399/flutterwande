import 'dart:convert';
import 'dart:io';

import 'package:wande/bean/user_bean.dart';
import 'package:wande/http_config.dart';

class HttpRequest {
  /**
   * 登录 异步请求
   */

  login(String account, String password) async {
    var uri = Uri.http(HttpConfig.BASE_URL, "core/oauth/login",
        {'userCode': account, 'userPwd': password});
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(uri);
    var response = await request.close();
    var responseBody = response.transform(utf8.decoder).join();
    return jsonDecode(responseBody.toString());
  }
}
