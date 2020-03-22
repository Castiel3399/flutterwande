typedef void ResponseSuccessCallback<T>(T result);
typedef void ResponseErrorCallback(int errorCode, String errMsg);

class HttpRequestCallback<T> {
  ResponseSuccessCallback<T> onSuccess;

  ResponseErrorCallback onError;

  HttpRequestCallback({ResponseSuccessCallback this.onSuccess, ResponseErrorCallback this.onError});
}
