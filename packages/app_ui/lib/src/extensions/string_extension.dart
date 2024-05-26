/// String Extension
extension StringExtension on String {
  /// capitalize case (first letter is capital, the rest is lowercase)
  String capitalize() {
    if (length > 1) {
      return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    } else {
      return toUpperCase();
    }
  }
}
