// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DietModel {
  String name;
  IconData icon;
  String level;
  String duration;
  String calorie;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.icon,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.viewIsSelected,
  });

  static List<DietModel> getDiets() { 
    List<DietModel> diets = []; 


diets.add(
  DietModel(name: "Dieta 1", icon: Icons.accessibility_new, level: "low", duration: "30mins", calorie: "189kCal", viewIsSelected: true)
);

diets.add(
  DietModel(name: "Dieta 2", icon: Icons.accessibility_new, level: "low", duration: "30mins", calorie: "189kCal", viewIsSelected: true)
);

diets.add(
  DietModel(name: "Dieta 3", icon: Icons.accessibility_new, level: "low", duration: "30mins", calorie: "189kCal", viewIsSelected: true)
);

diets.add(
  DietModel(name: "Dieta 4", icon: Icons.accessibility_new, level: "low", duration: "30mins", calorie: "189kCal", viewIsSelected: true)
);

diets.add(
  DietModel(name: "Dieta 5", icon: Icons.accessibility_new, level: "low", duration: "30mins", calorie: "189kCal", viewIsSelected: true)
);

diets.add(
  DietModel(name: "Dieta 6", icon: Icons.accessibility_new, level: "low", duration: "30mins", calorie: "189kCal", viewIsSelected: true)
);

diets.add(
  DietModel(name: "Dieta 7", icon: Icons.accessibility_new, level: "low", duration: "30mins", calorie: "189kCal", viewIsSelected: true)
);


    return diets;
  }


}
