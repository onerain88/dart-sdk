import 'package:flutter_test/flutter_test.dart';
import 'package:leancloud/leancloud.dart';
import 'package:leancloud/storage/leancloud_object.dart';

void main() {
  test('save', () async {
    LeanCloud.initialize('BMYV4RKSTwo8WSqt8q9ezcWF-gzGzoHsz', 'pbf6Nk5seyjilexdpyrPwjSp', 'bmyv4rks.lc-cn-n1-shared.com');
    LeanCloudObject obj = new LeanCloudObject();
    obj.className = 'Hello';
    obj.put('key1', 'value1');
    obj.put('key2', 'value2');
    await obj.save();
    assert(obj.objectId != null);
    assert(obj.get('key1') == 'value1');
    assert(obj.get('key2') == 'value2');
  });
}