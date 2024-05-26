import 'package:intl/intl.dart';

/// DateTime extension
extension DateTimeExtension on DateTime {
  /// first  letters of the day name
  String get dayNameShort => DateFormat('EEEE').format(this).substring(0, 3);
}
