import 'package:flutter/material.dart';
import 'package:wande/anim_widget/loading_image.dart';
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
          //image
          LoadingImageStatelessWidget("assets/images/icon_loading.png"),
          //text
          Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                content,
                style: TextStyle(
                    color: Colors.white, fontSize: AppDimens.text_size_normal),
              )),
        ],
      ),
    );
  }
}
