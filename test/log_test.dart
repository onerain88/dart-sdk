import 'package:flutter_test/flutter_test.dart';
import 'package:leancloud/common/Logger.dart';

import 'utils.dart';

void main() {
  test('log', () {
    Logger.setLog(log);
    Logger.debug('debug hello');
    Logger.warn('warn hello');
    Logger.error('error hello');
  });
}