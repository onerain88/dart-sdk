import 'package:leancloud/common/Logger.dart';

void log(LogLevel level, String message) {
  switch (level) {
    case LogLevel.Debug:
      print('[DEBUG] $message');
    break;
    case LogLevel.Warn:
      print('[WARN] $message');
    break;
    case LogLevel.Error:
      print('[ERROR] $message');
    break;
    default:
    break;
  }
}