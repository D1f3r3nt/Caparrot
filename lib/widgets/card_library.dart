import 'package:caparrot/models/library_model.dart';
import 'package:caparrot/provider/provider.dart';
import 'package:caparrot/utils/palete.dart';
import 'package:caparrot/utils/popup.dart';
import 'package:flutter/material.dart';

class CardLibrary extends StatelessWidget {
  final LibraryModel model;
  const CardLibrary({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firebaseCrudProvider = Provider.of<FirebaseCrudProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                color: Palete.black50,
                blurRadius: 8,
              )
            ],
            image: DecorationImage(
              image: NetworkImage(model.image),
              fit: BoxFit.cover,
              opacity: 0.6,
            ),
          ),
          child: Center(
            child: Text(
              model.title,
              style: TextStyle(
                color: Palete.white20,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ),
        onTap: () {
          popUpLibrary(context, model);
          firebaseCrudProvider.addLibrary(model);
        },
      ),
    );
  }
}
