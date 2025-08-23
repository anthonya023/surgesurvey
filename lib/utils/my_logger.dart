import 'package:logger/web.dart';

var logger = Logger(printer: PrettyPrinter());

var loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0));

class MyLoggerP {
  static void d({required String message}) {
    logger.d(message, error: null, stackTrace: StackTrace.current);
  }

  static void e({required String message, Object? error, StackTrace? stackTrace}) {
    logger.e(message, error: error, stackTrace: stackTrace ?? StackTrace.current);
  }

  static void w({required String message, Object? error, StackTrace? stackTrace}) {
    logger.w(message, error: error, stackTrace: stackTrace ?? StackTrace.current);
  }

  static void i({required String message}) {
    logger.i(message, error: null, stackTrace: StackTrace.current);
  }

  static void v({required String message}) {
    logger.t(message, error: null, stackTrace: StackTrace.current);
  }

  static void wtf({required String message, Object? error, StackTrace? stackTrace}) {
    logger.f(message, error: error, stackTrace: stackTrace ?? StackTrace.current);
  }

  static void log({required String message, int methodCount = 0}) {
    var customLogger = Logger(printer: PrettyPrinter(methodCount: methodCount));
    customLogger.d(message, error: null, stackTrace: StackTrace.current);
  }
}
