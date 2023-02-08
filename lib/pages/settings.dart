import 'package:caparrot/provider/provider.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool volumen = true;
  String url = "assets/sound_on.png";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('opcions'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                  child: Center(
                      child: Text(
                    "Activar/Desactivar volumen",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  alignment: Alignment.centerRight,
                  width: size.width * 0.6,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 180, 180, 180),
                  )),
              InkWell(
                onTap: () => {sound(), setState(() {})},
                child: Ink(
                  color: Color.fromARGB(255, 110, 110, 110),
                  height: size.height * 0.1,
                  width: size.width * 0.4,
                  child: Container(
                      decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(url), fit: BoxFit.contain),
                  )),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: size.width * 0.6,
                height: size.height * 0.1,
                color: Color.fromARGB(255, 205, 205, 205),
                child: Center(
                    child: Text(
                  "Idioma:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                )),
              ),
              Container(
                width: size.width * 0.4,
                height: size.height * 0.1,
                color: Color.fromARGB(255, 161, 161, 161),
                child: Idiomas(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  sound() {
    volumen
        ? {
            volumen = false,
            Provider.of<MusicProvider>(context, listen: false).volumenOff()
          }
        : {
            volumen = true,
            Provider.of<MusicProvider>(context, listen: false).volumeOn()
          };
    if (volumen) {
      url = "assets/sound_on.png";
    } else {
      url = "assets/sound_off.png";
    }
  }
}
