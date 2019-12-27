import 'package:leancloud/storage/leancloud_request.dart';

class LeanCloudFunction {
  Future<T> callFunction<T>(String name, Map<String, dynamic> data) async {
    var path = '/1.1/functions/$name';
    var method = LeanCloudRequestMethod.post;
    
  }
}