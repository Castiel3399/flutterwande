import 'package:wande/factory/EntityFactory.dart';

class BasePageBean<T> {
  List<T> records;
  int currentPage;

  BasePageBean.fromJson(json) {
    currentPage = json['currentPage'];
    records = json['records'] != null
        ? (json['records'] as List)
            .map((value) => json[value] = EntityFactory.generateOBJ(value))
            .toList()
        : null;
  }
}
