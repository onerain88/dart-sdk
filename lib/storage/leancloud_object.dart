import 'package:leancloud/storage/leancloud_decoder.dart';
import 'package:leancloud/storage/leancloud_request.dart';

import '../leancloud.dart';

const String ClassNameKey = 'className';
const String ObjectIdKey = 'objectId';
const String CreatedAtKey = 'createdAt';
const String UpdatedAtKey = 'updatedAtKey';

class LCObject {
  Map<String, dynamic> data;

  bool isDirty;

  String get className => data[ClassNameKey];

  set className(String value) {
    data[ClassNameKey] = value;
    isDirty = true;
  }

  String get objectId => data[ObjectIdKey];

  set objectId(String value) {
    data[ObjectIdKey] = value;
    isDirty = true;
  }

  DateTime get createdAt => data[CreatedAtKey];

  DateTime get updatedAt => data[UpdatedAtKey];

  LCObject(String className) {
    data = new Map<String, dynamic>();
    this[ClassNameKey] = className;
  }

  operator [](String key) => data[key];

  operator []=(String key, dynamic value) {
    data[key] = value;
    isDirty = true;
  }

  Future<LCObject> save() async {
    var path = objectId == null ? '/1.1/classes/$className' : '/1.1/classes/$className/$objectId';
    var method = objectId == null ? LeanCloudRequestMethod.post : LeanCloudRequestMethod.put;
    var request = new LeanCloudRequest(path, method, data);
    var response = await LeanCloud.client.send(request);
    var obj = decode(response);
    merge(obj);
    return this;
  }

  merge(Map<dynamic, dynamic> data) {
    data.forEach((k, v) {
      this.data[k] = v;
    });
  }
}