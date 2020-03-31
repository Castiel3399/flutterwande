import 'package:flutter/material.dart';
import 'package:wande/bean/EvaBean.dart';
import 'package:wande/dialog/LoadingDialog.dart';
import 'package:wande/http/HttpConfig.dart';
import 'package:wande/http/HttpRequest.dart';
import 'package:wande/http/callback/HttpRequestCallback.dart';
import 'package:wande/http/response/HttpBaseResponse.dart';
import 'package:wande/layouts/Layouts.dart';
import 'package:wande/utils/ShareUtils.dart';

class HomePageEva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //listView

    requestData();
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
              child: ListView(),
              onRefresh: () {
                requestData();
              },
            ),
          ),
        ),
      ],
    );
  }

  void requestData() {
    HttpRequest().requestGet<List<EvaBean>>(
      HttpConfig.GET_ACTIVITY_ITEM_LIST,
      HttpRequestCallback(onSuccess: (result) {}, onError: (code, errMsg) {}),
      {'grade': 5.toString()},
    );
  }
}
