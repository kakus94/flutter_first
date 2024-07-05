import 'package:flutter/material.dart';
import 'package:flutter_first/learn_1/models/category_model.dart';
import 'package:flutter_first/learn_1/models/diet_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    _getDiets();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          const SizedBox(height: 40),
          _categoriesSecrion(),
          const SizedBox(height: 40),
          _recomendationDiets()
        ],
      ),
    );
  }

  ///MARK: Recomendation Diet
  Column _recomendationDiets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Recomendation\nfor Diet",
            style: _sectionStyle(),
          ),
        ),
        SizedBox(
            height: 180,
            // color: Colors.pink.shade200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.only(top: 20),
                    child: _recomendaionDierTile(index),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 18),
                itemCount: diets.length))
      ],
    );
  }

  Column _recomendaionDierTile(int index) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
            // color: Colors.red,
            shape: BoxShape.circle),
        child: Icon(diets[index].icon),
      ),
      Text(
        diets[index].name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}")
        ],
      ),
      Container(
        height: 35,
        width: 130,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 5, 91, 162)]),
            borderRadius: BorderRadius.circular(12)),
        child: const Text(
          "View",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      )
    ]);
  }

//MARK: Category Section
  Column _categoriesSecrion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Category",
            style: _sectionStyle(),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 120,
          // color: Colors.green.withOpacity(0.2),
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                    color: categories[index].boxColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: categories[index].icon,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      categories[index].name,
                      style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  TextStyle _sectionStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w800,
    );
  }

//MARK: Search bar
  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            hintText: "Search prompt",
            hintStyle: const TextStyle(
              color: Color(0xffdddada),
              fontSize: 14,
            ),
            fillColor: Colors.white,
            prefixIcon: const Icon(Icons.abc),
            suffixIcon: const IntrinsicHeight(
              child: SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.2,
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.abc_outlined)),
                  ],
                ),
              ),
            ),
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
    );
  }

//MARK: App Bart
  AppBar appBar() {
    return AppBar(
      title: navigationTitleText("Breakfast"),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: leadingNavigationButton(),
      actions: [tralingNavigationButton()],
    );
  }

  GestureDetector tralingNavigationButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: const Icon(Icons.access_alarm_sharp),
      ),
    );
  }

  GestureDetector leadingNavigationButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: const Icon(Icons.access_time_outlined),
      ),
    );
  }

  Text navigationTitleText(String title) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
