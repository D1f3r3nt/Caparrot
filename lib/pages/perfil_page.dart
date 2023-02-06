import 'package:caparrot/utils/palete.dart';
import 'package:caparrot/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Palete.green90,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Palete.white90,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/escudo.png'),
                fit: BoxFit.cover,
                opacity: 0.25),
          ),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/user.png'),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Nombre',
                      style: TextStyle(fontSize: 25, color: Palete.white20),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                color: Palete.white90,
                indent: 10,
                endIndent: 10,
                thickness: 1,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  children: [
                    Text('Aqui'),
                    Text('Aqui'),
                    Text('Aqui'),
                    Text('Aqui'),
                    Text('Aqui'),
                    Text('Aqui'),
                    Text('Aqui'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Divider(
                color: Palete.white90,
                indent: 10,
                endIndent: 10,
                thickness: 1,
              ),
              const SizedBox(height: 10),
              Estadistics(name: 'Metres caminats', points: '0'),
              Estadistics(name: 'Metres caminats', points: '0'),
              Estadistics(name: 'Metres caminats', points: '0'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MaterialButton(
                  padding: const EdgeInsets.all(8),
                  onPressed: () {},
                  color: Palete.black50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: Palete.white20),
                      const SizedBox(width: 10),
                      Text(
                        'Logout',
                        style: TextStyle(color: Palete.white20),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
