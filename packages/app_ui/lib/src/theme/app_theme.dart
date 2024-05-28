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
      scaffoldBackgroundColor: AppColor.lightBlue4,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white2,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColor.lightBlue1,
        size: 24,
      ),
      dialogBackgroundColor: AppColor.white2,
      dialogTheme: const DialogTheme(
        backgroundColor: AppColor.white2,
        elevation: 5,
        surfaceTintColor: Colors.transparent,
        shadowColor: AppColor.black,
      ),
    );
  }
}
