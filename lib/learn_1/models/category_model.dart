import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  Icon icon;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: "Nazwa 1", icon: const Icon(Icons.abc), boxColor: Colors.red));

    categories.add(CategoryModel(
        name: "Nazwa 2", icon: const Icon(Icons.abc), boxColor: const Color.fromARGB(255, 58, 119, 91)));

    categories.add(CategoryModel(
        name: "Nazwa 3", icon: const Icon(Icons.abc), boxColor: const Color.fromARGB(255, 141, 25, 17)));

    categories.add(CategoryModel(
        name: "Nazwa 4", icon: const Icon(Icons.abc), boxColor: Colors.red));

    categories.add(CategoryModel(
        name: "Nazwa 5", icon: const Icon(Icons.abc), boxColor: Colors.red));

    categories.add(CategoryModel(
        name: "Nazwa 6", icon: const Icon(Icons.abc), boxColor: Colors.red));

    categories.add(CategoryModel(
        name: "Nazwa 7", icon: const Icon(Icons.abc), boxColor: Colors.red));

    categories.add(CategoryModel(
        name: "Nazwa 8", icon: const Icon(Icons.abc), boxColor: Colors.red));

        return categories;

  }
}
