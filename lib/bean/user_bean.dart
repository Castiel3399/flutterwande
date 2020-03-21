import 'package:wande/bean/base_json_bean.dart';

class UserBean extends BaseJsonBean {
  int id;
  String userId;
  String userCode;
  String schoolCode;
  String userName;
  String userLogo;
  String userSex;
  String userType;
  String userStatus;
  String remark;
  int stuId;
  int studentNum;
  String classCode;
  String className;
  int grade;
  String gradeName;
  String schoolLogo;
  String schoolName;
  int isMarked;
  String updateTime;
  String itemCode;
  int schoolYear;

  UserBean.fromJson(Map<String, dynamic> json) {
    userId = json["userId"];
  }
}
