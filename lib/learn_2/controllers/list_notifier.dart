import 'package:flutter/material.dart';
import 'package:flutter_first/learn_2/model/todo_model.dart';

class ListNotifier extends ValueNotifier<List<TodoModel>> {
  ListNotifier(super.value);

  void addTask(TodoModel task) {
    value = [...value..add(task)];
    notifyListeners();
  }
}
