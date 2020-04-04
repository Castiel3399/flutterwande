import 'package:flutter/material.dart';
import 'package:wande/res/AppColors.dart';

class EvaBean {
  /**
   * 修得
   */
  static const String TYPE_XIUDE = "xiude";

  /**
   * 健体
   */
  static const String TYPE_JIANTI = "jianti";

  /**
   * 求知
   */
  static const String TYPE_QIUZHI = "qiuzhi";

  /**
   * 习科
   */
  static const String TYPE_XIKE = "xike";

  /**
   * 学艺
   */
  static const String TYPE_XUEYI = "xueyi";

  int activityId;
  String createTime;
  String creator;
  int id;
  String itemCode;
  String itemName;

  EvaBean(
      {this.activityId,
      this.createTime,
      this.creator,
      this.id,
      this.itemCode,
      this.itemName});

  factory EvaBean.fromJson(Map<String, dynamic> json) {
    return EvaBean(
      activityId: json['activityId'],
      createTime: json['createTime'],
      creator: json['creator'],
      id: json['id'],
      itemCode: json['itemCode'],
      itemName: json['itemName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activityId'] = this.activityId;
    data['createTime'] = this.createTime;
    data['creator'] = this.creator;
    data['id'] = this.id;
    data['itemCode'] = this.itemCode;
    data['itemName'] = this.itemName;
    return data;
  }

  String getItemIcon() {
    if (itemCode == TYPE_XIUDE) return "assets/images/icon_project_xd.png";
    if (itemCode == TYPE_JIANTI) return "assets/images/icon_project_jt.png";
    if (itemCode == TYPE_QIUZHI) return "assets/images/icon_project_qz.png";
    if (itemCode == TYPE_XIKE) return "assets/images/icon_project_xk.png";
    if (itemCode == TYPE_XUEYI) return "assets/images/icon_project_xy.png";
  }

  Color getItemColor() {
    if (itemCode == TYPE_XIUDE) return AppColors.color_xd;
    if (itemCode == TYPE_JIANTI) return AppColors.color_jt;
    if (itemCode == TYPE_QIUZHI) return AppColors.color_qz;
    if (itemCode == TYPE_XIKE) return AppColors.color_xk;
    if (itemCode == TYPE_XUEYI) return AppColors.color_xy;
  }
}
