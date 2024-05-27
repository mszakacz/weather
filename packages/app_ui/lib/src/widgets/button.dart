import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// Button
class Button extends StatelessWidget {
  /// Button
  const Button({
    required this.text,
    required this.onTap,
    super.key,
  });

  /// the text that will be displayed on the button
  final String text;

  /// the Function that will be called when the button is tapped
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyles.h3blue,
      ),
    );
  }
}
