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

  LoadingImageState(this.imgPath) {
    animationController = AnimationController(
        reverseDuration: Duration(seconds: 10),
        duration: Duration(milliseconds: 1000),
        vsync: this);
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
      turns: animationController,
    );
  }
}
