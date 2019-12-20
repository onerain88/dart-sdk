import 'package:flutter_test/flutter_test.dart';
import 'package:leancloud/leancloud.dart';

void main() {
  test('create object', () async {
    LeanCloud.initialize('BMYV4RKSTwo8WSqt8q9ezcWF-gzGzoHsz', 'pbf6Nk5seyjilexdpyrPwjSp', 'bmyv4rks.lc-cn-n1-shared.com');
    var result = await LeanCloud.defaultLeanCloud.client.post('/1.1/classes/Post', data: {
      'content': 'flutter content'
    });
    print(result);
  });

  test('fetch object', () async {
    LeanCloud.initialize('BMYV4RKSTwo8WSqt8q9ezcWF-gzGzoHsz', 'pbf6Nk5seyjilexdpyrPwjSp', 'bmyv4rks.lc-cn-n1-shared.com');
    var result = await LeanCloud.defaultLeanCloud.client.getObject('/1.1/classes/Post', '5dfc6ba7dd3c1300729b5d8d');
    print(result);
  });
}