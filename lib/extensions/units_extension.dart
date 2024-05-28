import 'package:flutter/material.dart';
import 'package:weather/l10n/l10n.dart';
import 'package:weather_repository/weather_repository.dart';

extension UnitsExtension on Units {
  String description(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case Units.metric:
        return '${l10n.metric} ${l10n.metricDescription}';

      case Units.imperial:
        return '${l10n.imperial} ${l10n.imperialDescription}';
    }
  }

  String speedUnit() {
    switch (this) {
      case Units.metric:
        return 'm/s';

      case Units.imperial:
        return 'mph';
    }
  }
}
