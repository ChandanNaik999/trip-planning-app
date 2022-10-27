import 'package:logger/logger.dart';

// ignore: constant_identifier_names
enum LogLevel { L_INFO, L_DEBUG, L_WARNING, L_ERROR }

abstract class AbstractLogger {
  void log(LogLevel level, String message);
}

class MLogger implements AbstractLogger {
  final logger = Logger();

  MLogger();

  @override
  void log(LogLevel level, String message) {
    switch (level) {
      case LogLevel.L_DEBUG:
        logger.d(message);
        break;
      case LogLevel.L_WARNING:
        logger.w(message);
        break;
      case LogLevel.L_ERROR:
        logger.e(message);
        break;
      default:
        logger.i(message);
        break;
    }
  }
}

MLogger logger = MLogger();
