import 'package:flutter/material.dart';
import 'package:wande/dialog/LoadingDialog.dart';
import 'package:wande/layouts/Layouts.dart';

class HomePageRank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        generateActionBar("榜单"),
        Expanded(
          flex: 1,
          child: ListView(),
        ),
      ],
    );
  }
}
