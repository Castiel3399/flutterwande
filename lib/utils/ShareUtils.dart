import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'package:wande/bean/UserBean.dart';

class ShareUtils {
  static var USER_BEAN = "user_bean";
  static var IS_LOGIN = "is_login";
  static var TOKEN = "token";

  static String DEVICE_ID = "device_id";

  static UserBean userBean;
  static String devideId;
  static String token;

  static Future<SharedPreferences> getShare() async {
    return await SharedPreferences.getInstance();
  }

  /**
   * 保存用户bean
   */
  static saveUserBean(UserBean userBeanTemp) async {
    userBean = userBeanTemp;
    var sharedPreferences = await getShare();
    await sharedPreferences.setString(USER_BEAN, userBeanTemp.toString());
  }

  static Future initAppData() async {
    var sharedPreferences = await getShare();
    var userBeanJson = await sharedPreferences.getString(USER_BEAN);
    userBean = UserBean.fromJson(jsonDecode(userBeanJson));
    token = await initToken();
    devideId = await initDeviceId();
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
    return sharedPreferences.getBool(IS_LOGIN);
  }

  /**
   * 获取token
   */
  static Future<String> initToken() async {
    var sharedPreferences = await getShare();
    return sharedPreferences.getString(TOKEN);
  }

  /**
   * 保存token
   */
  static saveToken(tokenTemp) async {
    token = tokenTemp;
    var sharedPreferences = await getShare();
    await sharedPreferences.setString(TOKEN, token);
    print("save token:" + token);
  }

  /**
   * 获取设备id
   */
  static String getDeviceId() {
    return devideId;
  }

  static Future<String> initDeviceId() async {
    devideId = (await getShare()).getString(DEVICE_ID);
    if (devideId == null || devideId.isEmpty) {
      devideId = Uuid().v1();
      (await getShare()).setString(DEVICE_ID, devideId);
    }
  }

  static Future saveUserBeanAndToken(UserBean userBean, String token) async {
    await saveUserBean(userBean);
    await saveToken(token);
  }
}
