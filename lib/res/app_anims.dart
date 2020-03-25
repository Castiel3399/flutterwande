//旋转动画
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class AppAnims {
  static loading_trans_anim(view) {
    var animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: view);
    animationController.forward();
  }
}
