import 'dart:convert';

import 'package:leancloud/storage/leancloud_object.dart';

LCObject decodeObject(dynamic data) {
  String className = data['className'];
  return new LCObject(className);
}

dynamic decode(dynamic data) {
  if (data is Map) {
    if (data.containsKey('__type')) {
      // 支持的内置类型
      var type = data['__type'];
      assert(type is String);
      if (type == 'Date') {
        return decodeDate(data['iso']);
      } else if (type == 'Bytes') {
        // Base64 解码
        return base64Decode(data['base64']);
      } else if (type == 'Object') {
        return decodeObject(data);
      } else if (type == 'Pointer') {
        // 引用对象
        return decodeObject(data);
      } else if (type == 'relation') {
        // TODO 返回 Relation 对象
        return null;
      } else if (type == 'GeoPoint') {
        // TODO 返回坐标对象
        return {
          double.parse(data['latitude']),
          double.parse(data['longitude'])
        };
      }
    }
    // 普通的 Map 类型
    return data.map((key, value) {
      return new MapEntry(key, decode(value));
    });
  } else if (data is List) {
    return data.map((item) => decode(item)).toList();
  }
  return data;
}

DateTime decodeDate(dynamic data) {
  return DateTime.parse(data);
}