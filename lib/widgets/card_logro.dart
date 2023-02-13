import 'package:caparrot/models/models.dart';
import 'package:flutter/material.dart';

class CardLogro extends StatelessWidget {
  final AchievementModel model;

  const CardLogro({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        child: Container(
          height: 65.0,
          width: 65.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(3)),
            image: DecorationImage(
              image: NetworkImage(model.image),
            ),
          ),
        ),
        onTap: () => {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 129, 243, 178),
                titleTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 255, 86, 86),
                  fontSize: 20.0,
                ),
                contentTextStyle:
                    const TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                title: Text(model.title),
                content: Text(model.description),
              );
            },
          ),
        },
      ),
    );
  }
}
