// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class ColorPickerItem extends StatelessWidget {
  const ColorPickerItem({
    super.key,
    required this.color,
    required this.isChecked,
  });

  final Color color;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      child: CircleAvatar(
        backgroundColor: color,
        child: isChecked ? const Icon(Icons.check) : null,
      ),
    );
  }
}
