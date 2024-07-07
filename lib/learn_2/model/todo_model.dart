// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_first/learn_2/model/todo_priority.dart';
import 'package:flutter_first/learn_2/view/todo_list.dart';

class TaskModel {
  TaskModel(
      {required this.id,
      required this.title,
      required this.subtitle,
      this.color,
      this.priority = TodoPriority.high,
      required bool isCheck});
  String id;
  String title;
  String? subtitle;
  Color? color;
  bool isCheck = false;
  TodoPriority priority = TodoPriority.normal;

  void toggle() {
    isCheck = !isCheck;
  }

  static List<TaskModel> getList() {
    List<TaskModel> result = [];

    result.add(TaskModel(
        title: "Zakupy",
        subtitle: "Biedrona",
        color: Colors.blueAccent,
        id: uuid.v4(),
        isCheck: false));

    result.add(TaskModel(
        title: "Zakupy",
        subtitle: "Lidl",
        color: const Color.fromARGB(255, 72, 131, 42),
        id: uuid.v4(),
        isCheck: false));

    result.add(TaskModel(
        title: "Zakupy",
        subtitle: "Dino",
        color: const Color.fromARGB(255, 178, 143, 46),
        id: uuid.v4(),
        isCheck: false));

    return result;
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? subtitle,
    Color? color,
    bool? isCheck,
    TodoPriority? priority,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      color: color ?? this.color,
      isCheck: isCheck ?? this.isCheck,
      priority: priority ?? this.priority,
    );
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'title': title,
  //     'subtitle': subtitle,
  //     'color': color?.value,
  //     'isCheck': isCheck,
  //     'priority': priority.toMap(),
  //   };
  // }

  // factory TodoModel.fromMap(Map<String, dynamic> map) {
  //   return TodoModel(
  //     id: map['id'] as String,
  //     title: map['title'] as String,
  //     subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
  //     color: map['color'] != null ? Color(map['color'] as int) : null,
  //     isCheck: map['isCheck'] as bool,
  //     priority: TodoPriority.fromMap(map['priority'] as Map<String, dynamic>),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory TodoModel.fromJson(String source) =>
  //     TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, subtitle: $subtitle, color: $color, isCheck: $isCheck, priority: $priority)';
  }

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.color == color &&
        other.isCheck == isCheck &&
        other.priority == priority;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        color.hashCode ^
        isCheck.hashCode ^
        priority.hashCode;
  }
}
