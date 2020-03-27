class ClassBean {
  String classCode;
  String className;
  String disciplineCode;
  String disciplineName;
  int grade;
  String gradeName;
  int id;
  String isHeadMaster;
  String schoolCode;
  String schoolLogo;
  String schoolName;
  int studentNum;
  String userCode;
  String userId;
  String userLogo;
  String userName;
  String userType;

  /**
   * 班级
   */
  ClassBean(
      {this.classCode,
      this.className,
      this.disciplineCode,
      this.disciplineName,
      this.grade,
      this.gradeName,
      this.id,
      this.isHeadMaster,
      this.schoolCode,
      this.schoolLogo,
      this.schoolName,
      this.studentNum,
      this.userCode,
      this.userId,
      this.userLogo,
      this.userName,
      this.userType});

  factory ClassBean.fromJson(Map<String, dynamic> json) {
    return ClassBean(
      classCode: json['classCode'],
      className: json['className'],
      disciplineCode: json['disciplineCode'],
      disciplineName: json['disciplineName'],
      grade: json['grade'],
      gradeName: json['gradeName'],
      id: json['id'],
      isHeadMaster: json['isHeadMaster'],
      schoolCode: json['schoolCode'],
      schoolLogo: json['schoolLogo'],
      schoolName: json['schoolName'],
      studentNum: json['studentNum'],
      userCode: json['userCode'],
      userId: json['userId'],
      userLogo: json['userLogo'],
      userName: json['userName'],
      userType: json['userType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classCode'] = this.classCode;
    data['className'] = this.className;
    data['disciplineCode'] = this.disciplineCode;
    data['disciplineName'] = this.disciplineName;
    data['grade'] = this.grade;
    data['gradeName'] = this.gradeName;
    data['id'] = this.id;
    data['isHeadMaster'] = this.isHeadMaster;
    data['schoolCode'] = this.schoolCode;
    data['schoolLogo'] = this.schoolLogo;
    data['schoolName'] = this.schoolName;
    data['studentNum'] = this.studentNum;
    data['userCode'] = this.userCode;
    data['userId'] = this.userId;
    data['userLogo'] = this.userLogo;
    data['userName'] = this.userName;
    data['userType'] = this.userType;
    return data;
  }
}
