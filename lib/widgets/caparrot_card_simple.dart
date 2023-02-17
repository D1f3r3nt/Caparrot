import 'package:caparrot/utils/palete.dart';
import 'package:flutter/material.dart';

class CapaTag extends StatelessWidget {
  String url;
  String nom;
  CapaTag({
    required this.url,
    required this.nom,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.5,
      child: GestureDetector(
        onTap: () => {print(nom)},
        child: Center(
            child: Container(
          width: size.width * 0.9,
          height: size.height * 0.9,
          decoration: BoxDecoration(
              color: Palete.green90,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.white, width: 2)),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 13),
                  width: size.width * 0.8,
                  height: size.width * 0.7,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(url),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white, width: 2)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: size.width * 0.8,
                  height: size.width * 0.15,
                  decoration: BoxDecoration(
                    border: Border.all(color: Palete.white90, width: 2),
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                    color: Palete.green50,
                  ),
                  child: Center(
                    child: Text(
                      nom,
                      style: TextStyle(
                          color: Palete.black90,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
