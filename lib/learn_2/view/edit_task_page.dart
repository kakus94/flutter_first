// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_first/learn_2/controllers/list_notifier.dart';
import 'package:flutter_first/learn_2/model/todo_model.dart';
import 'package:flutter_first/learn_2/model/todo_priority.dart';
import 'package:flutter_first/learn_2/view/todo_list.dart';
import 'package:flutter_first/learn_2/widgets/color_picker.dart';
import 'package:flutter_first/learn_2/widgets/dropdown_priority_picker.dart';

class EditTaskPage extends StatefulWidget {
  EditTaskPage({super.key, required this.listNotifier});

  final TextEditingController nameTaskController = TextEditingController();
  final TextEditingController descTaskController = TextEditingController();
  final ListNotifier listNotifier;
  final ValueNotifier<Color> colorNotifier = ValueNotifier(Colors.white);
  final ValueNotifier<TodoPriority> priorityNotifier =
      ValueNotifier(TodoPriority.high);

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
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
                controller: widget.nameTaskController,
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
              const Text(
                "Description",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: widget.descTaskController,
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
                colorNotifier: widget.colorNotifier,
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownPriorityPicker(
                priorityNotifier: widget.priorityNotifier,
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
