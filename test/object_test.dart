import 'package:flutter_test/flutter_test.dart';
import 'package:leancloud/leancloud.dart';
import 'package:leancloud/storage/leancloud_object.dart';

void main() {
  test('save', () async {
    LeanCloud.initialize('BMYV4RKSTwo8WSqt8q9ezcWF-gzGzoHsz', 'pbf6Nk5seyjilexdpyrPwjSp', 'bmyv4rks.lc-cn-n1-shared.com');
    LCObject obj = new LCObject('Hello');
    obj['k1'] = 123;
    obj['k2'] = true;
    obj['k3'] = 'v3';
    await obj.save();
    // print(obj);
    assert(obj.objectId != null);
    assert(obj['k1'] == 123);
    assert(obj['k2']);
    assert(obj['k3'] == 'v3');
  });
}