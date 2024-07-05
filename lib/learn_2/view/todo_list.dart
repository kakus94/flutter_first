// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_first/learn_2/controllers/list_notifier.dart';
import 'package:flutter_first/learn_2/view/edit_task_page.dart';
import 'package:flutter_first/learn_2/model/todo_model.dart';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

List<TodoModel> listOfTask = [
  TodoModel(
    title: 'first Task',
    color: Colors.yellow,
    subtitle: '',
    id: uuid.v4(),
  ),
];

class TodoList extends StatelessWidget {
  TodoList({super.key});
  bool check = false;

  List<TodoModel> tasks = TodoModel.getList();

  final listNotifier = ListNotifier(listOfTask);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
        backgroundColor: const Color.fromARGB(255, 102, 146, 223),
      ),
      body: ValueListenableBuilder(
        valueListenable: listNotifier,
        builder: (context, value, child) {
          return ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EditTaskPage(
                    listNotifier: listNotifier,
                    task: value[index],
                  ),
                ));
              },
              child: TodoTile(
                task: value[index],
              ),
            ),
            itemCount: value.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditTaskPage(
                listNotifier: listNotifier,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoTile extends StatefulWidget {
  TodoTile({super.key, required this.task});

  TodoModel task;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: widget.task.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          leading: Checkbox(
            value: widget.task.isCheck,
            onChanged: (value) => setState(() {
              widget.task.toggle();
            }),
          ),
          title: Text(widget.task.title),
          subtitle: Text(widget.task.subtitle ?? ""),
          trailing: widget.task.priority.icon,
        ),
      ),
    );
  }
}
