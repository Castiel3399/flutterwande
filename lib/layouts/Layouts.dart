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
        "评价",
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
