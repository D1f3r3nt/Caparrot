import 'package:caparrot/models/head_model.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class CapaTag extends StatelessWidget {
  HeadModel model;
  bool enable;

  CapaTag({
    required this.model,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enable) {
          Navigator.pushNamed(context, 'tresD', arguments: model);
        } else {
          Snackbar.errorSnackbar(context, 'No tienes este caparrot');
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 180,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Palete.green70, Palete.green90],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    colorFilter: (enable)
                        ? null
                        : const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.saturation,
                          ),
                    image: AssetImage('assets/caparrots/${model.image}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                model.name,
                style: TextStyle(
                  color: Palete.black90,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
