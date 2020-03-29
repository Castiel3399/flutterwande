import 'package:flutter/material.dart';
import 'package:wande/dialog/LoadingDialog.dart';
import 'package:wande/layouts/Layouts.dart';

class HomePageEva extends StatelessWidget {
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
          child: ListView(),
        ),
      ],
    );
  }
}
