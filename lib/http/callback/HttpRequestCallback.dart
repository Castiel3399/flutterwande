import 'package:wande/http/response/BasePageBean.dart';

typedef void ResponseSuccessCallback<T>(T result);
typedef void ResponseSuccessListCallback<T>(List<T> result);
typedef void ResponseSuccessPageCallback<T>(BasePageBean<T> result);

typedef void ResponseErrorCallback(int errorCode, String errMsg);

class HttpRequestCallback<K, T> {
  /**
   * 成功回调
   */
  ResponseSuccessListCallback<T> onSuccessList;
  ResponseSuccessPageCallback<T> onSuccessPage;
  ResponseSuccessCallback<T> onSuccess;

  /**
   * 失败回调
   */
  ResponseErrorCallback onError;

  /**
   * {}  参数可选
   */
  HttpRequestCallback({this.onSuccess, this.onSuccessList, this.onError});
}
