import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wande/bean/user_bean.dart';

class ShareUtils {
  static var USER_BEAN = "user_bean";
  static var IS_LOGIN = "is_login";

  static Future<SharedPreferences> getShare() async {
    return await SharedPreferences.getInstance();
  }

  /**
   * 保存用户bean
   */
  static saveUserBean(userBean) async {
    var sharedPreferences = await getShare();
    await sharedPreferences.setString(USER_BEAN, jsonEncode(userBean));
  }

  /**
   * 获取用户bean
   */
  static Future<UserBean> getUserBean() async {
    var sharedPreferences = await getShare();
    var userBeanJson = await sharedPreferences.getString(USER_BEAN);
    return UserBean.fromJson(jsonDecode(userBeanJson));
  }

  /**
   * 保存登陆状态
   */
  static saveIsLogin(isLogin) async {
    var sharedPreferences = await getShare();
    await sharedPreferences.setBool(IS_LOGIN, isLogin);
  }

  /**
   * 是否已经登陆
   */
  static Future<bool> getIsLogin() async {
    var sharedPreferences = await getShare();
    return await sharedPreferences.getBool(IS_LOGIN);
  }
}