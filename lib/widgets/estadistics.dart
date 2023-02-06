import 'package:caparrot/utils/palete.dart';
import 'package:flutter/material.dart';

class Estadistics extends StatelessWidget {
  final String name;
  final String points;

  const Estadistics({
    Key? key,
    required this.name,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(name,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Palete.white90)),
          Text(points, style: TextStyle(fontSize: 25, color: Palete.white90))
        ],
      ),
    );
  }
}
