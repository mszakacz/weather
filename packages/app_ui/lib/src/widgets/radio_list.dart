import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

/// RadioList widget
class RadioList<T> extends StatelessWidget {
  /// RadioList widget
  const RadioList({
    required this.values,
    required this.selected,
    required this.onChange,
    required this.textBuilder,
    super.key,
  });

  /// values
  final List<T> values;

  /// initiallySelected
  final T selected;

  /// onChange
  final void Function(T?) onChange;

  /// Text builder
  final String Function(T) textBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: values
          .map(
            (v) => RadioListItem<T>(
              value: v,
              selected: selected,
              onChange: onChange,
              text: textBuilder(v),
            ),
          )
          .toList(),
    );
  }
}

/// RadioListItem
class RadioListItem<T> extends StatelessWidget {
  /// RadioListItem
  const RadioListItem({
    required this.value,
    required this.selected,
    required this.onChange,
    required this.text,
    super.key,
  });

  /// value
  final T value;

  /// selected
  final T selected;

  /// onChange
  final void Function(T?) onChange;

  /// text
  final String text;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      value: value,
      groupValue: selected,
      onChanged: onChange,
      title: Text(
        text,
        style: TextStyles.h4,
      ),
    );
  }
}
