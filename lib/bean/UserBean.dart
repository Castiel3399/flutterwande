import 'dart:convert';

class UserBean {
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

  UserBean.fromJsonMap(Map<String, dynamic> json) {
//    id
//    userId
//    userCode
//    schoolCode
//    userName
//    userLogo
//    userSex
//    userType
//    userStatus
//    remark
//    stuId
//    studentNum
//    classCode
//    className
//    grade
//    gradeName
//    schoolLogo
//    schoolName
//    isMarked
//    updateTime
//    itemCode
//    schoolYear

    id = json["id"];
    userId = json["userId"];
    userCode = json["userCode"];
    schoolCode = json["schoolCode"];
    userName = json["userName"];
    userLogo = json["userLogo"];
    userSex = json["userSex"];
    userType = json["userType"];
    userStatus = json["userStatus"];
    remark = json["remark"];
    stuId = json["stuId"];
    studentNum = json["studentNum"];
    classCode = json["classCode"];
    className = json["className"];
    grade = json["grade"];
    gradeName = json["gradeName"];
    schoolLogo = json["schoolLogo"];
    schoolName = json["schoolName"];
    isMarked = json["isMarked"];
    updateTime = json["updateTime"];
    itemCode = json["itemCode"];
    schoolYear = json["schoolYear"];
  }

  Map toJsonMap() {
    Map<String, dynamic> map = Map();
    map['id'] = id;
    map['userId'] = userId;
    map['userCode'] = userCode;
    map['schoolCode'] = schoolCode;
    map['userName'] = userName;
    map['userLogo'] = userLogo;
    map['userSex'] = userSex;
    map['userType'] = userType;
    map['userStatus'] = userStatus;
    map['remark'] = remark;
    map['stuId'] = stuId;
    map['studentNum'] = studentNum;
    map['classCode'] = classCode;
    map['className'] = className;
    map['grade'] = grade;
    map['gradeName'] = gradeName;
    map['schoolLogo'] = schoolLogo;
    map['schoolName'] = schoolName;
    map['isMarked'] = isMarked;
    map['updateTime'] = updateTime;
    map['itemCode'] = itemCode;
    map['schoolYear'] = schoolYear;
    print(jsonEncode(map));
    return map;
  }

  String toJson() {
    return jsonEncode(toJsonMap());
  }
}
