import 'dart:convert';

import 'Role.dart';
import 'SchoolInfo.dart';
import 'ClassBean.dart';

class UserBean {
  int id;
  String remark;
  List<Role> roleList;
  String schoolCode;
  List<SchoolInfo> schoolInfoList;
  List<ClassBean> teacherInfoList;
  String userCode;
  String userId;
  String userLogo;
  String userName;
  String userSex;
  String userStatus;
  String userType;
  String studentRemark;
  UserBean studentInfo;

  UserBean(
      {this.id,
      this.remark,
      this.roleList,
      this.schoolCode,
      this.schoolInfoList,
      this.teacherInfoList,
      this.userCode,
      this.userId,
      this.userLogo,
      this.userName,
      this.userSex,
      this.userStatus,
      this.userType,
      this.studentRemark,
      this.studentInfo});

  factory UserBean.fromJson(Map<String, dynamic> json) {
    return UserBean(
      id: json['id'],
      remark: json['remark'],
      roleList: json['roleList'] != null
          ? (json['roleList'] as List).map((i) => Role.fromJson(i)).toList()
          : null,
      schoolCode: json['schoolCode'],
      schoolInfoList: json['schoolInfoList'] != null
          ? (json['schoolInfoList'] as List)
              .map((i) => SchoolInfo.fromJson(i))
              .toList()
          : null,
      teacherInfoList: json['teacherInfoList'] != null
          ? (json['teacherInfoList'] as List)
              .map((i) => ClassBean.fromJson(i))
              .toList()
          : null,
      userCode: json['userCode'],
      userId: json['userId'],
      userLogo: json['userLogo'],
      userName: json['userName'],
      userSex: json['userSex'],
      userStatus: json['userStatus'],
      userType: json['userType'],
      studentRemark: json['studentRemark'],
      studentInfo: json['studentInfo'] == null
          ? null
          : UserBean.fromJson(json['studentInfo']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['remark'] = this.remark;
    data['schoolCode'] = this.schoolCode;
    data['userCode'] = this.userCode;
    data['userId'] = this.userId;
    data['userLogo'] = this.userLogo;
    data['userName'] = this.userName;
    data['userSex'] = this.userSex;
    data['userStatus'] = this.userStatus;
    data['userType'] = this.userType;
    data['studentRemark'] = this.studentRemark;
    if (this.studentInfo != null) {
      data['studentInfo'] = this.studentInfo.toJson();
    }
    if (this.roleList != null) {
      data['roleList'] = this.roleList.map((v) => v.toJson()).toList();
    }
    if (this.schoolInfoList != null) {
      data['schoolInfoList'] =
          this.schoolInfoList.map((v) => v.toJson()).toList();
    }
    if (this.teacherInfoList != null) {
      data['teacherInfoList'] =
          this.teacherInfoList.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
