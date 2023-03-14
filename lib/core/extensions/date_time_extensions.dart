import 'package:intl/intl.dart';

extension ToDateFormat on DateTime {
  String get format => DateFormat('dd.MM.yy').format(this);
}
