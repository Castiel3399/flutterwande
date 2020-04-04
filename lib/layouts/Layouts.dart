import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wande/res/AppColors.dart';
import 'package:wande/res/AppDimens.dart';

/**
 * action bar  (text)
 */
generateActionBar(text) {
  return SizedBox(
    width: double.infinity,
    height: kBottomNavigationBarHeight,
    child: Container(
      alignment: AlignmentDirectional.center,
      color: AppColors.color_primary,
      child: Text(
        text,
        style:
            TextStyle(fontSize: AppDimens.text_size_large, color: Colors.white),
      ),
    ),
  );
}

/**
 * action bar  (text/imageMenu)
 */
generateActionBarWithMenu(context, text, String iconPath, callback) {
  return SizedBox(
    width: double.infinity,
    height: kBottomNavigationBarHeight,
    child: Container(
      color: AppColors.color_primary,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: kBottomNavigationBarHeight,
            child: Container(
              alignment: AlignmentDirectional.center,
              child: Text(
                "评价",
                style: TextStyle(
                    fontSize: AppDimens.text_size_large, color: Colors.white),
              ),
            ),
          ),
          Positioned(
            left:
                MediaQuery.of(context).size.width - kBottomNavigationBarHeight,
            width: kBottomNavigationBarHeight,
            top: 0,
            height: kBottomNavigationBarHeight,
            child: FlatButton(
              onPressed: callback,
              child: Image.asset(iconPath),
            ),
          )
        ],
      ),
    ),
  );
}

/**
 * 水波纹层
 */
getRippleLayout(double height, double radius, {GestureTapCallback callback}) {
  return SizedBox(
      width: double.infinity,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          splashColor: AppColors.color_ripple,
          highlightColor: AppColors.color_ripple_hight,
          onTap: callback == null ? () {} : GestureTapCallback,
        ),
      ));
}

/**
 * 水波纹层
 */
getRippleLayout2(double height, double radius, Widget child,
    {GestureTapCallback callback}) {
  return Stack(
    children: <Widget>[
      child,
      getRippleLayout(height, radius, callback: callback)
    ],
  );
}
