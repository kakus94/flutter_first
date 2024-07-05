// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first/learn_2/controllers/list_notifier.dart';
import 'package:flutter_first/learn_2/model/todo_model.dart';
import 'package:flutter_first/learn_2/model/todo_priority.dart';
import 'package:flutter_first/learn_2/view/todo_list.dart';
import 'package:flutter_first/learn_2/widgets/color_picker.dart';
import 'package:flutter_first/learn_2/widgets/dropdown_priority_picker.dart';

class EditTaskPage extends StatefulWidget {
  EditTaskPage({super.key, this.task, required this.listNotifier});

  final TodoModel? task;
  final TextEditingController nameTaskController = TextEditingController();
  final TextEditingController descTaskController = TextEditingController();
  final ListNotifier listNotifier;
  final ValueNotifier<Color> colorNotifier = ValueNotifier(Colors.white);
  final ValueNotifier<TodoPriority> priorityNotifier =
      ValueNotifier(TodoPriority.high);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();

  TextEditingController setTitleController(TodoModel? task) {
    if (task == null) return nameTaskController;
    return nameTaskController..text = task.title;
  }

  TextEditingController setDescController(TodoModel? task) {
    if (task == null) return descTaskController;
    return descTaskController..text = task.subtitle ?? "";
  }
}

class _EditTaskPageState extends State<EditTaskPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Task Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: widget.setTitleController(widget.task),
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //* Opis
              const Text(
                "Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: widget.setDescController(widget.task),
                autocorrect: false,
                keyboardType: TextInputType.multiline,
                maxLines: 8,
                minLines: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ColorPicker(
                colorNotifier: widget.colorNotifier
                  ..value = widget.task?.color ?? Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownPriorityPicker(
                priorityNotifier: widget.priorityNotifier
                  ..value = widget.task?.priority ?? TodoPriority.high,
              ),
              const SizedBox(
                height: 20,
              ),
              if (widget.task == null)
                MaterialButton(
                  onPressed: () {
                    if (widget.nameTaskController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Pole name nie moze byc puste")));
                      return;
                    }
                    widget.listNotifier.addTask(
                      TodoModel(
                          title: widget.nameTaskController.text,
                          subtitle: widget.descTaskController.text,
                          id: uuid.v4(),
                          color: widget.colorNotifier.value,
                          priority: widget.priorityNotifier.value),
                    );
                    Navigator.of(context).pop();
                  },
                  color: Colors.blueAccent,
                  child: const Text("Zapisz"),
                ),
              if (widget.task != null)
                MaterialButton(
                  onPressed: () {
                    if (widget.nameTaskController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Pole name nie moze byc puste")));
                      return;
                    }
                    widget.listNotifier.updateTask(
                      TodoModel(
                          title: widget.nameTaskController.text,
                          subtitle: widget.descTaskController.text,
                          id: widget.task!.id,
                          color: widget.colorNotifier.value,
                          priority: widget.priorityNotifier.value),
                    );
                    Navigator.of(context).pop();
                  },
                  color: Colors.blueAccent,
                  child: const Text("Update"),
                )
            ],
          ),
        ),
      ),
    );
  }
}
