import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreens extends StatelessWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Debes de estar en Sa Pobla',
              body:
                  'Para el uso de esta aplicacion es necesario que estes en Sa Pobla. Ve al ayuntamiento, ahi estara el comienzo de todo',
              image: buildImage("assets/Sa_Pobla.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Ayuntamiento de Sa Pobla',
              body: 'Para comenzar es necesario dirigirse al ayuntamiento',
              image: buildImage("assets/ayuntamiento.jpg"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Captura de caparrots',
              body:
                  'Si encuentras algun caparrot haz click sobre el y contesta la pregunta correctamente para capturarlo',
              image: buildImage("assets/caparrot.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Pistas',
              body:
                  'Ten en cuenta las pistas para encontrar los caparrots, dichas pistas estaran por Sa Pobla',
              image: buildImage("assets/papiro.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Obten los todos los caparrots',
              body:
                  '11 caparrots estan escondidos por Sa Pobla obtenlos todos para ganar',
              image: buildImage("assets/caparrots.png"),
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          isBottomSafeArea: true,
          skip: const Text("Saltar",
              style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.forward),
          done: const Text("Estoy listo",
              style: TextStyle(fontWeight: FontWeight.w600)),
          dotsDecorator: getDotsDecorator()),
    );
  }

  Widget buildImage(String imagePath) {
    return Center(
        child: Image.asset(
      imagePath,
      width: 450,
      height: 200,
    ));
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.indigo,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
