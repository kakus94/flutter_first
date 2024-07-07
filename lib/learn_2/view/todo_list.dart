// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_first/learn_2/widgets/dissmiss_background.dart';
import 'package:uuid/uuid.dart';

import 'package:flutter_first/learn_2/controllers/list_notifier.dart';
import 'package:flutter_first/learn_2/model/todo_model.dart';
import 'package:flutter_first/learn_2/view/edit_task_page.dart';

const uuid = Uuid();

List<TaskModel> listOfTask = [
  TaskModel(
    title: 'first Task',
    color: Colors.yellow,
    subtitle: '',
    id: uuid.v4(),
    isCheck: false,
  ),
];

class TodoList extends StatelessWidget {
  TodoList({
    super.key,
    required this.listNotifier,
  });
  bool check = false;

  final ListNotifier listNotifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
        backgroundColor: const Color.fromARGB(255, 102, 146, 223),
      ),
      body: ValueListenableBuilder<List<TaskModel>>(
        valueListenable: listNotifier,
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                  child: value.isNotEmpty ? listTask(value) : noTaskNotify()),
              ColoredBox(
                color: Colors.cyanAccent.shade400,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Done ${listNotifier.listOfDoneTask.length}",
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listNotifier.listOfDoneTask.length,
                  itemBuilder: (context, index) {
                    return listNotifier.listOfDoneTask.isNotEmpty
                        ? Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {
                                  listNotifier.toogleDone(
                                      listNotifier.listOfDoneTask[index]);
                                },
                              ),
                              Text(
                                listNotifier.listOfDoneTask[index].title,
                              ),
                            ],
                          )
                        : const Text("Brak");
                  },
                ),
              )
            ],
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

  Center noTaskNotify() {
    return const Center(
        child: Text(
      "Brak zadan",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ));
  }

  ListView listTask(List<TaskModel> value) {
    return ListView.builder(
      itemBuilder: (context, index) => dismisibleSubView(value, index, context),
      itemCount: value.length,
    );
  }

  Dismissible dismisibleSubView(
      List<TaskModel> value, int index, BuildContext context) {
    return Dismissible(
      key: ValueKey(value[index]),
      onDismissed: (direction) => listNotifier.removeTask(value[index]),
      direction: DismissDirection.endToStart,
      secondaryBackground:
          DissmissBackground(mainAxisAlignment: MainAxisAlignment.end),
      background:
          DissmissBackground(mainAxisAlignment: MainAxisAlignment.start),
      child: gestureOnTap_TileDodo(context, value, index),
    );
  }

  // ignore: non_constant_identifier_names
  GestureDetector gestureOnTap_TileDodo(
      BuildContext context, List<TaskModel> value, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditTaskPage(
            listNotifier: listNotifier,
            task: value[index],
          ),
        ));
      },
      child: TodoTile(
        listNotifier: listNotifier,
        task: value[index],
      ),
    );
  }
}

class TodoTile extends StatefulWidget {
  TodoTile({super.key, required this.task, required this.listNotifier});

  TaskModel task;
  ListNotifier listNotifier;

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
              widget.listNotifier.toogleDone(widget.task);
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
