import 'package:app_ui/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// LoadingView widget
class LoadingView extends StatelessWidget {
  /// {@macro loading_view}
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeRotatingDots(
        key: const Key('LoadingView'),
        color: AppColor.blue,
        size: 150,
      ),
    );
  }
}
