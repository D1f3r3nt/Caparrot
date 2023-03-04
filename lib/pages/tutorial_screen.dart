import 'package:caparrot/preferences/preferences.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class TutorialScreens extends StatelessWidget {
  const TutorialScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Has de estar a Sa Pobla',
              body:
                  'Per a l\'ús d\'aquesta aplicació és necessari que estiguis a Sa Pobla. Ves a l\'ajuntament, allà estarà el començament de tot',
              image: buildImage("assets/tutorial/Sa_Pobla.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Ajuntament de Sa Pobla',
              body: 'Per a començar és necessari dirigir-se a l\'ajuntament',
              image: buildImage("assets/tutorial/ayuntamiento.jpg"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Captura els caparrots',
              body:
                  'Si trobes algun caparrot fes clic sobre l\'i contesta la pregunta correctament per a capturar-ho',
              image: buildImage("assets/markers/grouxo.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Pistes',
              body:
                  'Tingues en compte les pistes per a trobar els caparrots, aquestes pistes se\'t proporcioneran una vegada capturis un caparrot',
              image: buildImage("assets/tutorial/papiro.png"),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Obten tots els caparrots',
              body:
                  '11 caparrots estan amagats per Sa Pobla obtenlos tots per a guanyar',
              image: buildImage("assets/tutorial/caparrots.png"),
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            Preferences.isFirstTime = false;
            Navigator.pushReplacementNamed(context, '/');
          },
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          isBottomSafeArea: true,
          skip: const Text("Següent",
              style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.forward),
          done: const Text("Estic llest",
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
