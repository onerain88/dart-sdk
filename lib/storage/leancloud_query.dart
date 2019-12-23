import 'package:leancloud/storage/leancloud_object.dart';
import 'package:leancloud/storage/leancloud_request.dart';

import '../leancloud.dart';

class LeanCloudQuery {
  String className;

  LeanCloudQuery(this.className);

  Future<List<LeanCloudObject>> findAll() async {
    var path = '/1.1/classes/$className';
    var method = LeanCloudRequestMethod.get;
    var request = new LeanCloudRequest(path, method, null);
    var response = await LeanCloud.defaultLeanCloud.client.send(request);
    print(response);
  }
}