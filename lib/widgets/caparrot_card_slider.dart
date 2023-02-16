import 'package:card_slider/card_slider.dart';
import 'package:flutter/material.dart';

class Caparrots_Target extends StatelessWidget {

 @override
Widget build(BuildContext context) {
  List<Widget> valuesWidget = [];
  var size = MediaQuery.of(context).size;
  int index = 0;
  List<String> valuesUrl = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Shaqi_jrvej.jpg/1200px-Shaqi_jrvej.jpg',
    'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
    'https://www.eea.europa.eu/themes/biodiversity/state-of-nature-in-the-eu/state-of-nature-2020-subtopic/image_print',
    'https://muyadictivo.com/wp-content/uploads/2022/07/significado-de-waifu-221.webp'
  ];

  for (int i = 0; i < valuesUrl.length; i++) {
    valuesWidget.add(
      Image.network(valuesUrl[i]),
    );
  }

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    body: GestureDetector(
       onTap: () => {print("${index}")},
      child: CardSlider(
        slideChanged: (value) => {},
        cards: valuesWidget,
        bottomOffset: .0008,
        itemDotWidth: 14,
        itemDotOffset: 0.15,
        itemDot: (itemDotWidth) {
          return  Container(
                margin: const EdgeInsets.all(5),
                width: 8 + itemDotWidth,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF33a000),
                ),
          );
        },
      ),
       
    ),
  );
}
  
}