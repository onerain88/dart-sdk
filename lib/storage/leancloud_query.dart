import 'package:leancloud/storage/leancloud_object.dart';
import 'package:leancloud/storage/leancloud_request.dart';

import '../leancloud.dart';
import 'leancloud_decoder.dart';

class LeanCloudQuery {
  String className;

  LeanCloudQuery(this.className);

  Future<List<LeanCloudObject>> findAll() async {
    var path = '/1.1/classes/$className';
    var method = LeanCloudRequestMethod.get;
    var request = new LeanCloudRequest(path, method, null);
    var response = await LeanCloud.client.send(request);
    var list = response['results'] as List<dynamic>;
    var objList = new List<LeanCloudObject>();
    list.forEach((item) {
      var obj = decodeObject(className, item);
      objList.add(obj);
    });
    return objList;
  }
}