import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wande/bean/EvaBean.dart';
import 'package:wande/dialog/LoadingDialog.dart';
import 'package:wande/http/HttpConfig.dart';
import 'package:wande/http/HttpRequest.dart';
import 'package:wande/http/callback/HttpRequestCallback.dart';
import 'package:wande/http/response/HttpListResponse.dart';
import 'package:wande/layouts/Layouts.dart';
import 'package:wande/res/AppColors.dart';
import 'package:wande/res/AppDimens.dart';

class HomePageEva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePageView> {
  List<EvaBean> dataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        generateActionBarWithMenu(context, "评价", "assets/images/icon_noti.png",
            () {
          showDialog(context: context, child: LoadingDialog());
        }),
        Expanded(
          flex: 1,
          child: RefreshIndicator(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: dataList == null ? 0 : dataList.length,
                  itemBuilder: (context, index) => getItemView(index)),
            ),
            onRefresh: () {
              return requestData();
            },
          ),
        ),
      ],
    );
  }

  Future<bool> requestData() async {
    return await HttpRequest().requestGet<HttpListResponse, EvaBean>(
      HttpConfig.GET_ACTIVITY_ITEM_LIST,
      HttpRequestCallback(onSuccessList: (result) {
        setState(() {
          dataList = result;
        });
        print(result.length);
      }, onError: (code, errMsg) {
        setState(() {
          dataList = null;
        });
        print("error");
      }),
      {'grade': 5.toString()},
    );
  }

  /**
   * 获取 item 布局
   */
  getItemView(int index) {
    EvaBean evaBean = dataList[index];
    return Container(
        margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            color: evaBean.getItemColor(),
            child: getRippleLayout2(75, 5, getItemLayout(evaBean))));
  }

  @override
  void initState() {
    super.initState();
    requestData();
  }

  /**
   * item 层
   */
  getItemLayout(EvaBean evaBean) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 70,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Stack(
              children: <Widget>[
                //评价项图标
                Positioned(
                    child: Image.asset(
                  evaBean.getItemIcon(),
                  width: 54,
                  height: 54,
                )),
                //文本 title
                Positioned(
                  left: 64,
                  top: 0,
                  height: 54,
                  child: Center(
                      child: Text(
                    evaBean.itemName,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppDimens.text_size_normal),
                  )),
                ),
                //圆三角形 图标
                Positioned(
                  right: 0,
                  top: 17,
                  child: SizedBox(
                    child: Image.asset(
                      "assets/images/icon_home_eva_item_open.png",
                      fit: BoxFit.fill,
                      width: 20,
                      height: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //下边白色色条
        Ink(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))),
          width: double.infinity,
          height: 5,
        )
      ],
    );
  }
}
