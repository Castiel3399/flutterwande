import 'dart:math';

import 'package:flutter/material.dart';

class LoadingImageStatelessWidget extends StatelessWidget {
  String imgPath;

  LoadingImageStatelessWidget(this.imgPath);

  @override
  Widget build(BuildContext context) {
    return LoadingImageStatefullWidget(imgPath);
  }
}

class LoadingImageStatefullWidget extends StatefulWidget {
  String imgPath;

  LoadingImageStatefullWidget(this.imgPath);

  @override
  State<LoadingImageStatefullWidget> createState() {
    return LoadingImageState(imgPath);
  }
}

class LoadingImageState extends State<LoadingImageStatefullWidget>
    with SingleTickerProviderStateMixin {
  String imgPath;
  AnimationController animationController;
  var curvedAnimation;

  LoadingImageState(this.imgPath) {
    animationController = AnimationController(
        reverseDuration: Duration(seconds: 10),
        duration: Duration(milliseconds: 1000),
        vsync: this);

    curvedAnimation = CurvedAnimation(
        parent: animationController, curve: AccelerateAndDecelerateCurve());
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      child: SizedBox(
        child: Image.asset(imgPath),
        width: 40,
        height: 40,
      ),
      turns: curvedAnimation,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class AccelerateAndDecelerateCurve extends Curve {
  //0-1
  @override
  double transform(double t) {
    if (t < 0.5) {
      return sin(pi * t / 3);
    } else {
      return 1 - sin(pi * (1 - t) / 3);
    }
  }
}
