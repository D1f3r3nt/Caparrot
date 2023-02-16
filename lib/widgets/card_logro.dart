import 'package:caparrot/models/models.dart';
import 'package:caparrot/utils/popup.dart';
import 'package:flutter/material.dart';

class CardLogro extends StatelessWidget {
  final AchievementModel model;
  final bool has;

  const CardLogro({
    Key? key,
    required this.model,
    required this.has,
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
              colorFilter: (has)
                  ? null
                  : const ColorFilter.mode(Colors.grey, BlendMode.saturation),
              image: NetworkImage(model.image),
            ),
          ),
        ),
        onTap: () => popUpAchievements(context, model),
      ),
    );
  }
}
