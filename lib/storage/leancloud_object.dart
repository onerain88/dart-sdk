import 'package:leancloud/storage/leancloud_decoder.dart';
import 'package:leancloud/storage/leancloud_request.dart';

import '../leancloud.dart';

class LeanCloudObject {
  String className;

  String objectId;

  DateTime createdAt;

  DateTime updatedAt;

  Map<String, dynamic> customProperties;

  bool isDirty;

  LeanCloudObject(this.className);

  String getClassName() {
    return className;
  }

  void setClassName(String value) {
    className = value;
    isDirty = true;
  }

  String getObjectId() {
    return objectId;
  }

  void setObjectId(String value) {
    objectId = value;
    isDirty = true;
  }

  DateTime getCreatedAt() {
    return createdAt;
  }

  DateTime getUpdatedAt() {
    return updatedAt;
  }

  dynamic get(String key) {
    return customProperties[key];
  }

  void put(String key, dynamic value) {
    if (customProperties == null) {
      customProperties = new Map<String, dynamic>();
    }
    customProperties[key] = value;
    isDirty = true;
  }

  Future<LeanCloudObject> save() async {
    var path = objectId == null ? '/1.1/classes/$className' : '/1.1/classes/$className/$objectId';
    var method = objectId == null ? LeanCloudRequestMethod.post : LeanCloudRequestMethod.put;
    var data = customProperties;
    var request = new LeanCloudRequest(path, method, data);
    var response = await LeanCloud.client.send(request);
    var obj = decodeObject(className, response);
    merge(obj);
    return this;
  }

  merge(LeanCloudObject obj) {
    if (obj.className != null) {
      className = obj.className;
    }
    if (obj.objectId != null) {
      objectId = obj.objectId;
    }
    if (obj.createdAt != null) {
      createdAt = obj.createdAt;
    }
    if (obj.updatedAt != null) {
      updatedAt = obj.updatedAt;
    }
    if (obj.customProperties != null && obj.customProperties.length > 0) {
      obj.customProperties.forEach((key, value) {
        customProperties[key] = value;
      });
    }
  }
}