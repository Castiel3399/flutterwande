typedef void ResponseSuccessCallback<T>(T result);
typedef void ResponseErrorCallback(int errorCode, String errMsg);

class HttpRequestCallback<T> {
  /**
   * 成功回调
   */
  ResponseSuccessCallback<T> onSuccess;

  /**
   * 失败回调
   */
  ResponseErrorCallback onError;

  /**
   * {}  参数可选
   */
  HttpRequestCallback({this.onSuccess, this.onError});
}
