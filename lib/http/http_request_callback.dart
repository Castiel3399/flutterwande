import 'package:wande/bean/base_json_bean.dart';

abstract class HttpRequestCallback<T extends BaseJsonBean> {
  void onSuccess(T t);

  void onError(int errCode, String errMsg);
}
