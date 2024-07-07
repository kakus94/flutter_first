import 'package:flutter/material.dart';
import 'package:flutter_first/learn_2/model/todo_model.dart';

class ListNotifier extends ValueNotifier<List<TaskModel>> {
  ListNotifier(super.value);

  List<TaskModel> listOfDoneTask = [];

  void addTask(TaskModel task) {
    value = [...value..add(task)];
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    final index = value.indexWhere(
      (element) => element.id == task.id,
    );
    if (index >= 0 && index < value.length) {
      value
        ..removeAt(index)
        ..add(task);
    }

    notifyListeners();
  }

  void removeTask(TaskModel task) {
    // ignore: avoid_print
    print("remove task ${task.title}");
    value = [...value..remove(task)];
    notifyListeners();
  }

  void toogleDone(TaskModel task) {
    final isDone = task.isCheck;
    if (isDone) {
      value = [...value..remove(task)];
      listOfDoneTask = [...listOfDoneTask..add(task.copyWith(isCheck: true))];
    } else {
      value = [...value..add(task.copyWith(isCheck: false))];
      listOfDoneTask = [...listOfDoneTask..remove(task)];
    }
    notifyListeners();
  }
}
