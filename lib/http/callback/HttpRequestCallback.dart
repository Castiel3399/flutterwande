typedef void ResponseSuccessCallback<T>(T result);
typedef void ResponseListSuccessCallback<T>(List<T> result);
typedef void ResponsePageSuccessCallback<T>(List<T> result);
typedef void ResponseErrorCallback(int errorCode, String errMsg);

/**
 * 单类 回调
 */
class HttpRequestCallback<T> {
  static var TYPE_NORMAL = 1;
  static var TYPE_LIST = 2;
  static var TYPE_PAGE_DATA = 3;
  var type = TYPE_NORMAL;

  /**
   * 成功回调
   */

  /**
   * 单类
   */
  ResponseSuccessCallback<T> onSuccess;

  /**
   * 集合
   */
  ResponseListSuccessCallback<T> onSuccessList;

  /**
   * 分页
   */
  ResponsePageSuccessCallback<T> onSuccessPageData;

  /**
   * 失败回调
   */
  ResponseErrorCallback onError;

  /**
   * {}  参数可选
   */
  HttpRequestCallback(
      {this.onSuccess,
      this.onSuccessList,
      this.onSuccessPageData,
      this.onError}) {
    if (this.onSuccess != null) {
      type = TYPE_NORMAL;
    } else if (this.onSuccessList != null) {
      type = TYPE_LIST;
    } else if (this.onSuccessPageData != null) {
      type = TYPE_PAGE_DATA;
    }
  }
}
