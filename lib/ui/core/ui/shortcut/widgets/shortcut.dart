import 'package:extramobs_utilitarios/domain/models/shortcut_model.dart';
import 'package:flutter/material.dart';

class ShortcutGrid extends StatelessWidget {
  const ShortcutGrid({
    super.key,
    required this.shortcuts,
    this.rowSpacing = 10,
    this.colSpacing = 10,
  });

  final List<ShortcutModel> shortcuts;
  final double rowSpacing;
  final double colSpacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: colSpacing,
      children: [
        KeyColunm(shortcuts: shortcuts),
        LabelColunm(shortcuts: shortcuts),
      ],
    );
  }
}

class KeyLabel extends StatelessWidget {
  const KeyLabel({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(content);
  }
}

class KeyChip extends StatelessWidget {
  const KeyChip(this.keyName, {super.key});

  final String keyName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        color: Colors.grey.shade100,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      child: Text(
        keyName,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class KeyColunm extends StatelessWidget {
  const KeyColunm({super.key, required this.shortcuts, this.rowSpacing = 10});

  final double rowSpacing;
  final List<ShortcutModel> shortcuts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: rowSpacing,
      children: [
        for (final shortcut in shortcuts)
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 2.5,
            children: [
              for (final (int index, String keyName)
                  in shortcut.labelKeys.indexed) ...[
                KeyChip(keyName),
                if (index < shortcut.labelKeys.length - 1) Text("+"),
              ],
            ],
          ),
      ],
    );
  }
}

class LabelColunm extends StatelessWidget {
  const LabelColunm({super.key, required this.shortcuts, this.rowSpacing = 10});

  final List<ShortcutModel> shortcuts;
  final double rowSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: rowSpacing,
      children: [
        for (final shortcut in shortcuts) KeyLabel(content: shortcut.label),
      ],
    );
  }
}
