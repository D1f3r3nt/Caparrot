import 'package:flutter/material.dart';

class CardLogro extends StatelessWidget {
  const CardLogro({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    image: AssetImage('assets/3KM.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('Camina 3 KM'),
                      content: Text(
                          'Camina 3 kilometros por Sa Pobla mientras buscas nuestros caparrots'),
                    );
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    image: AssetImage('assets/6KM.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('Camina 6 KM'),
                      content: Text(
                          'Camina 6 kilometros por Sa Pobla mientras buscas nuestros caparrots'),
                    );
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    image: AssetImage('assets/10KMpro.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('Camina 10 KM'),
                      content: Text(
                          'Camina 10 kilometros por Sa Pobla mientras buscas nuestros caparrots'),
                    );
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    image: AssetImage('assets/emblematicos1.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('Principiante en lugares emblematicos'),
                      content: Text(
                          'Visita tu primer lugar emblematico de Sa Pobla'),
                    );
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    image: AssetImage('assets/emblematicos4.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('Intermedio en lugares emblematicos'),
                      content: Text(
                          'Visita cuatro lugares emblematicos disponibles'),
                    );
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    image: AssetImage('assets/emblematicos10.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('Experto en lugares emblematicos'),
                      content: Text(
                          'Visita 10 o mas lugares emblematicos de los que tenemos disponibles'),
                    );
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    image: AssetImage('assets/10KMpro.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('Camina 10 KM'),
                      content: Text('Camina 10 kilometros'),
                    );
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    image: AssetImage('assets/1caparrot.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('Primer caparrot'),
                      content: Text('Obten tu primer caparrot'),
                    );
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    image: AssetImage('assets/5caparrots.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('5 caparrots'),
                      content:
                          Text('Obten 5 caparrots mientras descubres Sa Pobla'),
                    );
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Container(
                height: 65.0,
                width: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.saturation),
                    image: AssetImage('assets/13caparrots.png'),
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
                          color: Color.fromARGB(255, 255, 86, 86),
                          fontSize: 20.0),
                      contentTextStyle:
                          TextStyle(color: Color.fromARGB(255, 107, 8, 56)),
                      title: Text('Obten todos los caparrots'),
                      content: Text(
                          'Obten todos los caparrots que existen mientras estas averiguando más de Sa Pobla'),
                    );
                  },
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
