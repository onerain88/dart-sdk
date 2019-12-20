import 'package:leancloud/storage/leancloud_request.dart';

import '../leancloud.dart';

class LeanCloudObject {
  String className;

  String objectId;

  DateTime createdAt;

  DateTime updatedAt;

  Map<String, dynamic> customProperties;

  bool isDirty;

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
    var response = await LeanCloud.defaultLeanCloud.client.send(request);
    objectId = response['objectId'];
    createdAt = DateTime.parse(response['createdAt']);
    if (response.containsKey('updatedAt')) {
      updatedAt = DateTime.parse(response['updatedAt']);
    } else {
      updatedAt = createdAt;
    }
    // TODO 自定义属性

    return this;
  }
}