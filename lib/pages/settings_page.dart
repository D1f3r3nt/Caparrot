import 'package:caparrot/provider/provider.dart';
import 'package:caparrot/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool volumen = true;
  String url = "assets/sound_on.png";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    final _user = FirebaseAuth.instance.currentUser!;
    final TextEditingController _controller =
        TextEditingController(text: _user.displayName!);

    volumen = musicProvider.playing;

    return Scaffold(
      backgroundColor: Palete.green50,
      appBar: AppBar(
        title: const Text('Configuracio'),
        centerTitle: true,
        backgroundColor: Palete.green90,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                label: const Text('Nom d\'usuari'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Palete.white90,
              ),
            ),
          ),
          MaterialButton(
            color: Palete.black50,
            child: Text(
              'Cambiar nom d\'usuari',
              style: TextStyle(color: Palete.white90),
            ),
            onPressed: () {
              if (_controller.text.trim().length > 0) {
                _user.updateDisplayName(_controller.text.trim());
              }
            },
          ),
          Divider(
            color: Palete.black50,
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Musica",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Switch(
                value: volumen,
                onChanged: (value) => setState(() {
                  value ? musicProvider.volumeOn() : musicProvider.volumenOff();
                }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
