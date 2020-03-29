import 'package:flutter/material.dart';
import 'package:wande/layouts/Layouts.dart';

class HomePageUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        generateActionBar("我的"),
        Expanded(
          flex: 1,
          child: ListView(),
        ),
      ],
    );
  }
}
