import 'package:flutter/material.dart';

class CardLibrary extends StatelessWidget {
  const CardLibrary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Wrap(
      children: [
        InkWell(
          child: Container(
            height: screenHeight * 0.15,
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              image: DecorationImage(
                image: AssetImage('assets/baile.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 155, 229, 187),
                  titleTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 86, 86), fontSize: 20.0),
                  contentTextStyle:
                      TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                  title: Text('Música mallorquina'),
                  content: Text(
                      'El ritmo mallorquín es un estilo único de música folclórica que se toca en Sa Pobla y en toda la isla de Mallorca. La música se ha transmitido de generación en generación y es una forma importante de preservar las tradiciones y la identidad cultural local'),
                );
              },
            ),
          },
        ),
        InkWell(
          child: Container(
            height: screenHeight * 0.15,
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              image: DecorationImage(
                image: AssetImage('assets/festamajor.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 129, 243, 178),
                  titleTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 86, 86), fontSize: 20.0),
                  contentTextStyle:
                      TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                  title: Text('Festa major'),
                  content: Text(
                      'La Festa Major es la fiesta más importante de Sa Pobla, celebrada en honor de Sant Domingo y la Mare de Déu de l`Esperança. La fiesta incluye desfiles, música, bailes y otros eventos que celebran la historia y la cultura de la localidad'),
                );
              },
            ),
          },
        ),
        InkWell(
          child: Container(
            height: screenHeight * 0.15,
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              image: DecorationImage(
                image: AssetImage('assets/agricultura.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 129, 243, 178),
                  titleTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 86, 86), fontSize: 20.0),
                  contentTextStyle:
                      TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                  title: Text('La agricultura'),
                  content: Text(
                      'La agricultura es un aspecto importante de la economía y la cultura de Sa Pobla, con la localidad siendo conocida por sus productos agrícolas, como patatas, tomates y aceite de oliva'),
                );
              },
            ),
          },
        ),
        InkWell(
          child: Container(
            height: screenHeight * 0.15,
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              image: DecorationImage(
                image: AssetImage('assets/artesania.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 129, 243, 178),
                  titleTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 86, 86), fontSize: 20.0),
                  contentTextStyle:
                      TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                  title: Text('Artesania de sa pobla'),
                  content: Text(
                      'La artesanía es un aspecto importante de la cultura de Sa Pobla, con artesanos locales creando objetos de cerámica, textiles y otros materiales.'),
                );
              },
            ),
          },
        ),
        InkWell(
          child: Container(
            height: screenHeight * 0.15,
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              image: DecorationImage(
                image: AssetImage('assets/arquitecturareligiosa.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 129, 243, 178),
                  titleTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 86, 86), fontSize: 20.0),
                  contentTextStyle:
                      TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                  title: Text('Arquitectura religiosa'),
                  content: Text(
                      'El municipi de sa Pobla hi ha un total de 15 elements arquitectònics religiosos protegits pel seu valor històric i artístic. Aquests elements religiosos són de diversa categoria: petits oratoris rurals ubicats en possessions, el cementeri municipal o l`Església Parroquial de Sant Antoni Abat. Aquestes construccions han aconseguit romandre durant segles, més o manco transformades, gràcies al fet que han tingut un ús continuat en el temps i han estat llocs de devoció. Dintre del nucli urbà, molt a prop de la Plaça Major es troba la joia del poble, l`Església Parroquial de Sant Antoni Abat. A part de l`Església, també es pot visitar el Cementeri Municipal, l´Oratori de Crestatx i totes les creus de terme del municipi.'),
                );
              },
            ),
          },
        ),
        InkWell(
          child: Container(
            height: screenHeight * 0.15,
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              image: DecorationImage(
                image: AssetImage('assets/arquitectura.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 129, 243, 178),
                  titleTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 86, 86), fontSize: 20.0),
                  contentTextStyle:
                      TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                  title: Text('Arquitecura civil'),
                  content: Text(
                      'Els edificis més importants que podem trobar al municipi de Sa Pobla són les possessions de la ruralia i les cases senyorials de l`interior del poble. Aquestes edificacions escenifiquen el que fou ell loc de residència de les classes benestants del poble segles enrere. D`aquesta manera, les possessions i les cases senyorials són un element clau per poder entendre la història i cultura de Mallorca. Gràcies a elles, podem entendre com s`estructurava la societat antigament i quin era el seu  poder social i polític. Les possessions són construccions que esdevenien en nuclis rurals, ja que en elles es feien totes les feines agrícoles i ramaderes de la zona. En elles, s`hi pot trobar zones àmplies d`habitatge (casa dels senyors, casa dels amos, clastra, capella, etc.) i altres dependències per l`explotació agrícola (tafona, celler, molí, vaqueries, sestadors, etc.). A Mallorca arribaren a existir més de 1300 possessions repartides per a tota l`illa segons el mapa del Cardenal Despuig de l`any 1785.'),
                );
              },
            ),
          },
        ),
        InkWell(
          child: Container(
            height: screenHeight * 0.15,
            width: screenWidth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              image: DecorationImage(
                image: AssetImage('assets/albufera_1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          onTap: () => {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 129, 243, 178),
                  titleTextStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 86, 86), fontSize: 20.0),
                  contentTextStyle:
                      TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                  title: Text('Parque natural de sàlbufera de mallorca'),
                  content: Text(
                      'En el nostre municipi es troba el Parc Natural de s`Albufera de Mallorca. Aquest parc és la zona humida més extensa de les Illes Balears i esdevé com a una zona d`especial protecció per a les aus. Aquesta zona humida sempre ha estat molt important per a sa Pobla, ja que arribà a ser la finca de regadiu més gran d`Europa.'),
                );
              },
            ),
          },
        ),
      ],
    );
  }
}
