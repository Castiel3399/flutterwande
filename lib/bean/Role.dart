class Role {
  int id;
  String roleCode;
  String roleDesc;
  String roleName;
  bool userHave;

  /**
   * 角色
   */
  Role({this.id, this.roleCode, this.roleDesc, this.roleName, this.userHave});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      roleCode: json['roleCode'],
      roleDesc: json['roleDesc'],
      roleName: json['roleName'],
      userHave: json['userHave'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roleCode'] = this.roleCode;
    data['roleDesc'] = this.roleDesc;
    data['roleName'] = this.roleName;
    data['userHave'] = this.userHave;
    return data;
  }
}
