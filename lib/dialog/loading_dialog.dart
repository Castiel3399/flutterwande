import 'package:flutter/material.dart';
import 'package:wande/res/app_dimens.dart';

class LoadingDialog extends StatelessWidget {
  final String content;

  const LoadingDialog({Key key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/icon_loading.png"),
          Text(
            content,
            style: TextStyle(
                color: Colors.white, fontSize: AppDimens.text_size_normal),
          )
        ],
      ),
    );
  }
}
