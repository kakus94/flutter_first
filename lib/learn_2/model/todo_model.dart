// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_first/learn_2/model/todo_priority.dart';
import 'package:flutter_first/learn_2/view/todo_list.dart';

class TodoModel {
  TodoModel(
      {required this.id,
      required this.title,
      required this.subtitle,
      this.color,
      this.priority = TodoPriority.high});
  // ignore: prefer_const_constructors
  String id;
  String title;
  String? subtitle;
  Color? color;
  bool isCheck = false;
  TodoPriority priority = TodoPriority.normal;

  void toggle() {
    isCheck = !isCheck;
  }

  static List<TodoModel> getList() {
    List<TodoModel> result = [];

    result.add(TodoModel(
        title: "Zakupy",
        subtitle: "Biedrona",
        color: Colors.blueAccent,
        id: uuid.v4()));

    result.add(TodoModel(
        title: "Zakupy",
        subtitle: "Lidl",
        color: const Color.fromARGB(255, 72, 131, 42),
        id: uuid.v4()));

    result.add(TodoModel(
        title: "Zakupy",
        subtitle: "Dino",
        color: const Color.fromARGB(255, 178, 143, 46),
        id: uuid.v4()));

    return result;
  }
}
