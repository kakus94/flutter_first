import 'package:flutter/material.dart';

class DissmissBackground extends StatelessWidget {
  DissmissBackground({super.key, required this.mainAxisAlignment});

  MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
