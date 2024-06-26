import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:weather/extensions/units_extension.dart';
import 'package:weather/l10n/l10n.dart';
import 'package:weather_repository/weather_repository.dart';

class SettingsDialog {
  static void show({
    required BuildContext context,
    required void Function(Units?) onChange,
    required Units selected,
  }) {
    final l10n = context.l10n;
    BottomAnimatedDialog.show(
      context: context,
      title: l10n.units,
      content: SettingsDialogContent(
        onChange: onChange,
        selected: selected,
      ),
    );
  }
}

@visibleForTesting
class SettingsDialogContent extends StatelessWidget {
  const SettingsDialogContent({
    required this.onChange,
    required this.selected,
    super.key,
  });

  final void Function(Units?) onChange;
  final Units selected;

  @override
  Widget build(BuildContext context) {
    return RadioList<Units>(
      key: const Key('SettingsDialog_Content_RadioList'),
      values: Units.values,
      selected: selected,
      textBuilder: (u) => u.description(context),
      onChange: (u) {
        onChange(u);
        Navigator.of(context).pop();
      },
    );
  }
}
