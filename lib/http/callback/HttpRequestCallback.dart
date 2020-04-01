typedef void ResponseSuccessCallback<T>(T result);
typedef void ResponseSuccessListCallback<T>(List<T> result);
typedef void ResponseErrorCallback(int errorCode, String errMsg);

class HttpRequestCallback<T> {
  /**
   * 成功回调
   */
  ResponseSuccessListCallback<T> onSuccessList;
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
