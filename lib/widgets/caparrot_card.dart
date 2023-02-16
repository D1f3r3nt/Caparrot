import 'package:flutter/material.dart';

class Target extends StatefulWidget {
  String url = "https://media.glamour.es/photos/616f91df303e546fa7901824/5:7/w_1465,h_2051,c_limit/626442.jpg";
  String nom = "Cabezonsdfsddfsdfsdfsdfsdfdfsdfdfsdfd";
  

  Target.Card(String url,String nom){
    this.url = url;
    this.nom = nom;
  }


  Target();
  
  @override
  State<Target> createState() => _TargetState();
}

class _TargetState extends State<Target> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () => { print("card")},
          child: Column(children: [
            Container(
              width: size.width,
              height: size.height * 0.7,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(widget.url), fit: BoxFit.cover), borderRadius: BorderRadius.circular(40)),
            ),
            Container(
              width: size.width,
              height: size.height * 0.3,
              child: Center(child: Text(widget.nom, style: TextStyle(fontSize: 20,color: Colors.red),)),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: Colors.black, border: Border.all(color: Colors.white,width: 1)),
            )
          ]),
        ),
    );
  }
}