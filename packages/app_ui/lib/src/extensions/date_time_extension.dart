import 'package:intl/intl.dart';

/// DateTime extension
extension DateTimeExtension on DateTime {
  /// first  letters of the day name
  String get dayNameShort => DateFormat('EEEE').format(this).substring(0, 3);

  /// long DateTime format,
  /// e.g: Monday, 22.05
  String get longDate => DateFormat('EEEE, dd MMMM').format(this);
}
