// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_first/learn_2/utils/colors.dart';
import 'package:flutter_first/learn_2/widgets/color_picker_item.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    Key? key,
    required this.colorNotifier,
  }) : super(key: key);

  final ValueNotifier<Color> colorNotifier;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.entries
          .map((e) => GestureDetector(
              onTap: () {
                setState(() {
                  colors.updateAll((key, value) => false);
                  colors[e.key] = true;
                  widget.colorNotifier.value = e.key;
                });
              },
              child: ColorPickerItem(color: e.key, isChecked: e.value)))
          .toList(),
    );
  }
}
