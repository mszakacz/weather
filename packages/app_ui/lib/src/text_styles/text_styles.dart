import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// UI Text Style Definitions
abstract class TextStyles {
  static const _baseTextStyle = TextStyle(
    package: 'app_ui',
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );

  /// Heading 1
  static final TextStyle h1 = _baseTextStyle.copyWith(
    fontSize: 80,
    fontWeight: FontWeight.w600,
    height: 1.1,
    color: AppColor.white,
  );

  /// Heading 2
  static final TextStyle h2 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 1.15,
    color: AppColor.blue3,
  );

  /// Heading 3 - blue color
  static final TextStyle h3blue = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.15,
    color: AppColor.blue3,
  );

  /// Heading 3 - white color
  static final TextStyle h3white = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 1.15,
    color: AppColor.white,
  );

  /// Heading 4
  static final TextStyle h4 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColor.blue3,
  );

  /// Heading 5
  static final TextStyle h5 = _baseTextStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColor.blue1,
  );
}
