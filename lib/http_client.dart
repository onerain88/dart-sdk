import 'dart:io';
import 'dart:convert';

import 'package:leancloud/storage/leancloud_request.dart';

class Client {
  static const MediaType = 'application/json';

  String appId;
  String appKey;
  String authority;
  
  Client(this.appId, this.appKey, this.authority);

  Future<Map<String, dynamic>> post(String path, { Map<String, dynamic> data }) async {
    var client = new HttpClient();
    var uri = new Uri.https(authority, path);
    var request = await client.postUrl(uri);
    request.headers
      ..add('X-LC-Id', appId)
      ..add('X-LC-Key', appKey)
      ..add('Content-Type', MediaType);
    if (data != null) {
      request.write(jsonEncode(data));
    }
    var response = await request.close();
    var body = await response.transform(utf8.decoder).join();
    // TODO

    Map<String, dynamic> result = jsonDecode(body);
    return result;
  }

  Future<Map<String, dynamic>> getObject(String path, String objectId) async {
    var client = new HttpClient();
    var uri = new Uri.https(authority, '$path/$objectId');
    var request = await client.getUrl(uri);
    request.headers
      ..add('X-LC-Id', appId)
      ..add('X-LC-Key', appKey)
      ..add('Content-Type', MediaType);
    var response = await request.close();
    var body = await response.transform(utf8.decoder).join();

    Map<String, dynamic> result = jsonDecode(body);
    return result;
  }

  Future<Map<String, dynamic>> send(LeanCloudRequest request) async {
    var client = new HttpClient();
    var uri = new Uri.https(authority, request.path);
    HttpClientRequest req;
    switch (request.method) {
      case LeanCloudRequestMethod.get:
        req = await client.getUrl(uri);
      break;
      case LeanCloudRequestMethod.post:
        req = await client.postUrl(uri);
      break;
      case LeanCloudRequestMethod.put:
        req = await client.putUrl(uri);
      break;
      case LeanCloudRequestMethod.delete:
        req = await client.deleteUrl(uri);
      break;
      default:
      break;
    }
    req.headers
      ..add('X-LC-Id', appId)
      ..add('X-LC-Key', appKey)
      ..add('Content-Type', MediaType);
    if (request.data != null) {
      req.write(jsonEncode(request.data));
    }
    var response = await req.close();
    var body = await response.transform(utf8.decoder).join();
    Map<String, dynamic> result = jsonDecode(body);
    print(result);
    return result;
  }
}
