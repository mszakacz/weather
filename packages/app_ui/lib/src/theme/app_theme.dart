import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// The App [ThemeData].
class AppTheme {
  /// normal, default theme data
  static ThemeData get normal {
    return ThemeData(
      fontFamily: 'Poppins',
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      scaffoldBackgroundColor: AppColor.crystalBlue,
      cardTheme: const CardTheme(
        color: AppColor.lightBlue,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
