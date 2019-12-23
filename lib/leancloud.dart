library leancloud;

import 'package:leancloud/http_client.dart';

class LeanCloud {
  // 
  static String applicationId;
  
  static String applicationKey;

  static String applicationServer;

  static Client client;

  static LeanCloud defaultLC;

  static void initialize(appId, appKey, server) {
    applicationId = appId;
    applicationKey = appKey;
    applicationServer = server;
    client = new Client(appId, appKey, server);
  }
}
