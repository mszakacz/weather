import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// BottomAnimatedDialog
class BottomAnimatedDialog {
  /// show BottomAnimatedDialog
  static void show({
    required BuildContext context,
    required Widget content,
    String title = '',
  }) {
    showGeneralDialog(
      barrierLabel: 'BottomAnimatedDialog',
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (_, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: BottomAnimatedDialogWidget(
            content: content,
            title: title,
          ),
        );
      },
      transitionBuilder: (_, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(anim1),
          child: child,
        );
      },
    );
  }
}

@visibleForTesting

/// Bottom animated dialog widget
class BottomAnimatedDialogWidget extends StatelessWidget {
  /// Bottom animated dialog widget
  const BottomAnimatedDialogWidget({
    required this.content,
    required this.title,
    super.key,
  });

  /// the content of the Dialog
  final Widget content;

  /// Dialog title
  final String title;

  @override
  Widget build(BuildContext context) {
    const borderRadius = AppSpacing.l;

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: IntrinsicHeight(
        child: Container(
          width: double.maxFinite,
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 17,
          ),
          decoration: const BoxDecoration(
            color: AppColor.white2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
            ),
          ),
          child: Material(
            color: AppColor.white2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DialogTitle(
                  title: title,
                ),
                const SizedBox(height: 10),
                content,
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@visibleForTesting

/// DialogTitle
class DialogTitle extends StatelessWidget {
  /// DialogTitle
  const DialogTitle({
    required this.title,
    super.key,
  });

  /// The title of the dialog
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            key: const Key('DialogTitle_CloseDialogIconButton'),
            icon: const Icon(
              Icons.close_outlined,
              color: AppColor.blue3,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Text(
          title,
          style: TextStyles.h2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
