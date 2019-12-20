enum LeanCloudRequestMethod {
  get,
  post,
  put,
  delete,
  header,
  open,
  patch,
}

/// 用于封装 http 请求
class LeanCloudRequest {
  String path;

  LeanCloudRequestMethod method;

  Map<String, dynamic> data;

  LeanCloudRequest(this.path, this.method, this.data);
}