import 'package:flutter/cupertino.dart';

class BasePageRouteBuilder extends PageRouteBuilder {
  final Widget widget;

  BasePageRouteBuilder(this.widget)
      : super(
          transitionDuration: Duration(milliseconds: 400),
          pageBuilder: (BuildContext context, Animation<double> animation1,
              Animation<double> animation2) {
            return widget;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget widget) {
            return SlideTransition(
              child: widget,
              position: Tween(begin: Offset(0, 0), end: Offset(400, 0)).animate(
                  CurvedAnimation(
                      parent: animation1, curve: Curves.fastOutSlowIn)),
            );
          },
        );
}
