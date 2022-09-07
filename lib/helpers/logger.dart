import 'package:logger/logger.dart';

class LoggerHelper {
  static Logger logger = Logger(
    filter: null,
    printer: PrettyPrinter(),
    output: null
  );
}
