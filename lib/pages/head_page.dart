import 'package:caparrot/utils/utils.dart';
import 'package:caparrot/widgets/caparrot_card_simple.dart';
import 'package:caparrot/widgets/caparrot_card_slider.dart';
import 'package:flutter/material.dart';

class HeadPage extends StatelessWidget {
  const HeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Palete.black50,
      appBar: AppBar(
        title: Center(child: Text("Caparrots")),
      ),
      body: ListView(
        children: [
          CapaTag.Card(
              "https://ponsport.com/wp-content/uploads/2016/12/008-1.png",
              "Groucho"),
          Divider(),
          CapaTag.Card(
              "https://perdidoenmallorca.files.wordpress.com/2015/01/dsc00469.jpg",
              "otro cabezon"),
          Divider(),
          CapaTag.Card(
              "https://perdidoenmallorca.files.wordpress.com/2015/01/dsc00469.jpg",
              "otro cabezon"),
        ],
      ),
    );
  }
}
