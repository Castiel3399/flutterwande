class SchoolInfo {
  int id;
  String regionId;
  String schoolCode;
  String schoolName;
  String status;

  /**
   * 学校
   */
  SchoolInfo(
      {this.id, this.regionId, this.schoolCode, this.schoolName, this.status});

  factory SchoolInfo.fromJson(Map<String, dynamic> json) {
    return SchoolInfo(
      id: json['id'],
      regionId: json['regionId'],
      schoolCode: json['schoolCode'],
      schoolName: json['schoolName'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['regionId'] = this.regionId;
    data['schoolCode'] = this.schoolCode;
    data['schoolName'] = this.schoolName;
    data['status'] = this.status;
    return data;
  }
}
