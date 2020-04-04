import 'package:flutter/material.dart';
import 'package:wande/layouts/Layouts.dart';
import 'package:wande/utils/ShareUtils.dart';

class HomePageUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        generateActionBar("我的"),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            //滚动view
            child: ListView(
              children: <Widget>[
                //头像item 高度 80
                getRippleLayout2(
                    80,
                    0,
                    Ink(
                        color: Colors.white,
                        child: SizedBox(
                          height: 80,
                          child: Stack(
                            children: <Widget>[
                              //头像
                              Positioned(
                                left: 10,
                                top: 15,
                                //头像宽高
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  //头像圆角
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    child: Image.network(
                                        ShareUtils.userBean.userLogo),
                                  ),
                                ),
                              ),
                              //名字,角色(学生:名字,年级)
                              Positioned(
                                left: 70,
                                top: 0,
                                height: 80,
                                child: Center(
                                  child: Text(ShareUtils.userBean.userName),
                                ),
                              ),
                            ],
                          ),
                        ))),
              ],
            ),
          ),
        )
      ],
    );
  }
}
