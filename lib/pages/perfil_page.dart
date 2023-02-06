import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(size),
            settingsAchievements(size),
            body(size),
          ],
        ),
      ),
    );
  }
}

SafeArea header(Size size) {
  String userImage =
      'https://i.blogs.es/66b2a4/photo-1511367461989-f85a21fda167/1366_2000.jpeg';
  return SafeArea(
    child: Center(
      child:
          CircleAvatar(radius: 120, backgroundImage: NetworkImage(userImage)),
    ),
  );
}

Container settingsAchievements(Size size) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    width: size.width * 0.7,
    height: size.height * 0.05,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
        onPressed: () {},
        iconSize: 40,
        icon: Icon(Icons.settings),
      ),
      IconButton(
        onPressed: () {},
        iconSize: 40,
        icon: Icon(Icons.account_balance_wallet),
      ),
    ]),
  );
}

Column body(Size size) {
  return Column(children: [
    Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 1),
        ),
        margin: EdgeInsets.only(top: size.height * 0.018),
        padding: EdgeInsets.only(left: size.width * 0.08),
        height: size.height * 0.06,
        width: size.width * 0.89,
        alignment: Alignment.centerLeft,
        child: const Text('Nombre de usuario:',
            style: TextStyle(fontSize: 19, color: Colors.white))),
    Container(
      margin: EdgeInsets.only(top: size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 1.8),
      ),
      height: size.height * 0.385,
      width: size.width * 0.89,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black45, width: 3),
            ),
            alignment: Alignment.center,
            width: size.width * 0.8,
            height: size.height * 0.05,
            child: const Text('Informacion general:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                )),
          ),
          contentsRowOne(size),
          contentsRowTwo(size),
          contentsRowThree(size)
        ],
      ),
    )
  ]);
}

Row contentsRowOne(Size size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26, width: 3)),
        alignment: Alignment.center,
        width: size.width * 0.35,
        height: size.height * 0.055,
        child: const Text('Pasos totales',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26, width: 3)),
        alignment: Alignment.center,
        width: size.width * 0.35,
        height: size.height * 0.055,
        child: const Text('Coleccionables',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    ],
  );
}

Row contentsRowTwo(Size size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26, width: 3)),
        alignment: Alignment.center,
        width: size.width * 0.35,
        height: size.height * 0.055,
        child: const Text('Otras cosas',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26, width: 3)),
        alignment: Alignment.center,
        width: size.width * 0.35,
        height: size.height * 0.055,
        child: const Text('Otras cosas',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    ],
  );
}

Row contentsRowThree(Size size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26, width: 3)),
        alignment: Alignment.center,
        width: size.width * 0.35,
        height: size.height * 0.055,
        child: const Text('Otras cosas',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black26, width: 3)),
        alignment: Alignment.center,
        width: size.width * 0.35,
        height: size.height * 0.055,
        child: const Text('Otras cosas',
            style: TextStyle(color: Colors.white, fontSize: 14)),
      ),
    ],
  );
}
