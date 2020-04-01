import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:wande/bean/UserBean.dart';
import 'package:wande/dialog/LoadingDialog.dart';
import 'package:wande/http/HttpRequest.dart';
import 'package:wande/http/callback/HttpRequestCallback.dart';
import 'package:wande/http/response/HttpNormalResponse.dart';
import 'package:wande/pages/HomePage.dart';
import 'package:wande/res/AppColors.dart';
import 'package:wande/res/AppDimens.dart';
import 'package:wande/utils/ShareUtils.dart';

import 'http/response/HttpBaseResponse.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
//    SystemChrome.setSystemUIOverlayStyle(
//        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.color_primary,
        accentColor: AppColors.color_accent,
        primaryColorDark: AppColors.color_primary_dark,
      ),
      home: LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController mETAccount =
      TextEditingController.fromValue(TextEditingValue(text: "wdteacher"));
  TextEditingController mETPassword =
      TextEditingController.fromValue(TextEditingValue(text: "123456"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
        color: AppColors.color_primary,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              child: Image.asset("assets/images/img_logo.png"),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Text(
                '万德好少年评选系统',
                style: TextStyle(
                    color: Colors.white, fontSize: AppDimens.text_size_bigger),
              ),
            ),
            //账号输入
            _newLoginEditField(
                mETAccount, "账号", "assets/images/icon_login_account.png"),
            //密码输入
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: _newLoginEditField(
                  mETPassword, "密码", "assets/images/icon_lock.png"),
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: RaisedButton(
                textColor: AppColors.color_text_color_main,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimens.border_radius_normal)),
                color: Colors.white,
                onPressed: () {
                  login(mETAccount.text, mETPassword.text);
                },
                child: Text("登陆"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * new 输入框
   */
  _newLoginEditField(
      TextEditingController controller, String hint, String imgPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.border_radius_normal),
      child: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(8),
                width: 40,
                height: 40,
                child: Image.asset(imgPath)),
            SizedBox(
              width: _calcInputWidth(context),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle:
                        TextStyle(color: AppColors.color_text_color_hint)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*******************数据逻辑******************/

  /**
   * 计算输入框的宽
   */
  _calcInputWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - 100;
  }

  /**
   * 登录
   */
  login(String account, String password) {
    showDialog(
        context: context,
        child: LoadingDialog(
          content: "登录中",
        ));

    //设备id
    ShareUtils.initDeviceId().whenComplete(() {
      //获取到设备ID
      HttpRequest().requestPost<HttpBaseResponse,UserBean>(
          "core/oauth/login",
          HttpRequestCallback(onSuccess: (result) {
            requestToken(result);
          }, onError: (errCode, errMsg) {
            Navigator.pop(context);
          }),
          {
            'userCode': account,
            'userPwd': md5.convert(utf8.encode(password)).toString()
          });
    });
  }

  /**
   * 请求token
   */
  requestToken(UserBean userBean) {
    HttpRequest().requestPost<HttpBaseResponse, String>(
        "core/oauth/accessToken",
        HttpRequestCallback(onSuccess: (token) {
          //获取token成功
          Navigator.pop(context);
          ShareUtils.saveUserBeanAndToken(userBean, token).whenComplete(() {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          });
        }, onError: (errCode, errMsg) {
          Navigator.pop(context);
        }),
        {'operatorId': userBean.userId});
  }
}
