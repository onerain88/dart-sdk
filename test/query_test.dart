import 'package:flutter_test/flutter_test.dart';
import 'package:leancloud/leancloud.dart';
import 'package:leancloud/storage/leancloud_query.dart';

void main() {
  test('find all', () async {
    LeanCloud.initialize('BMYV4RKSTwo8WSqt8q9ezcWF-gzGzoHsz', 'pbf6Nk5seyjilexdpyrPwjSp', 'bmyv4rks.lc-cn-n1-shared.com');
    var query = new LeanCloudQuery('Hello');
    await query.findAll();
  });
}