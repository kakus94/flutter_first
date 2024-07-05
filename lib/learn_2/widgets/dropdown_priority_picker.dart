// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_first/learn_2/model/todo_priority.dart';

class DropdownPriorityPicker extends StatefulWidget {
  DropdownPriorityPicker({
    super.key,
    required this.priorityNotifier,
  });

  // final ValueNotifier priorityNotifier;
  TodoPriority? initialDropdownValue = TodoPriority.high;
  final ValueNotifier<TodoPriority> priorityNotifier;

  @override
  State<DropdownPriorityPicker> createState() => _DropdownPriorityPickerState();
}

class _DropdownPriorityPickerState extends State<DropdownPriorityPicker> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: widget.priorityNotifier.value,
      items: TodoPriority.values
          .map(
            (element) => DropdownMenuItem(
              value: element,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(element.text),
                    const SizedBox(
                      width: 4,
                    ),
                    element.icon
                  ],
                ),
              ),
            ),
          )
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          widget.initialDropdownValue = value;
          widget.priorityNotifier.value =
              widget.initialDropdownValue ?? TodoPriority.high;
        });
      },
    );
  }
}
