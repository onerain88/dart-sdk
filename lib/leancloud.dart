library leancloud;

import 'package:leancloud/http_client.dart';

class LeanCloud {
  // 
  String appId;
  
  String appKey;

  String authority;

  Client client;

  static LeanCloud defaultLC;

  static LeanCloud get defaultLeanCloud {
    return defaultLC;
  }

  static LeanCloud initialize(String appId, String appKey, String authority) {
    defaultLC = new LeanCloud(appId, appKey, authority);
    return defaultLC;
  }

  LeanCloud(this.appId, this.appKey, this.authority) {
    client = new Client(appId, appKey, authority);
  }
}
