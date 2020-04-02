import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wande/bean/EvaBean.dart';
import 'package:wande/dialog/LoadingDialog.dart';
import 'package:wande/http/HttpConfig.dart';
import 'package:wande/http/HttpRequest.dart';
import 'package:wande/http/callback/HttpRequestCallback.dart';
import 'package:wande/http/response/HttpListResponse.dart';
import 'package:wande/layouts/Layouts.dart';

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
          child: Container(
            child: RefreshIndicator(
              child: ListView.builder(
                  itemCount: dataList == null ? 0 : dataList.length,
                  itemBuilder: (context, index) => getItemView(index)),
              onRefresh: () {
                return requestData();
              },
            ),
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

  getItemView(int index) {
    return Text(dataList[index].itemName);
  }

  @override
  void initState() {
    super.initState();
    requestData();
  }
}
