class EvaBean {
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
}
