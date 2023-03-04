import 'package:caparrot/provider/achievements_provider.dart';
import 'package:caparrot/utils/palete.dart';
import 'package:caparrot/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:caparrot/provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _user = FirebaseAuth.instance.currentUser;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final firebaseCrudProvider = Provider.of<FirebaseCrudProvider>(context);
    final achievementsProvider = Provider.of<AchievementsProvider>(context);
    if (achievementsProvider.achievements.isEmpty) {
      achievementsProvider.getData();
    }

    final String imageUrl = (_user != null)
        ? _user.photoURL ??
            'https://firebasestorage.googleapis.com/v0/b/caparrot-87657.appspot.com/o/user.png?alt=media&token=3321d148-9e7c-4d27-82b2-22919c5c4921'
        : 'https://firebasestorage.googleapis.com/v0/b/caparrot-87657.appspot.com/o/user.png?alt=media&token=3321d148-9e7c-4d27-82b2-22919c5c4921';

    void _onLogOut() {
      authProvider.logout(context);
    }

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Palete.green90,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'settings');
            },
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
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        (_user != null)
                            ? _user.displayName ?? _user.email!
                            : '',
                        style: TextStyle(fontSize: 25, color: Palete.white20),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
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
                padding: const EdgeInsets.all(5),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  children: achievementsProvider.achievements
                      .map((achievements) => CardLogro(
                            model: achievements,
                            has: (firebaseCrudProvider.user == null)
                                ? false
                                : firebaseCrudProvider.user!.logros
                                    .contains(achievements.id),
                          ))
                      .toList(),
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
              Estadistics(
                name: 'Caparrots obtinguts',
                points: (firebaseCrudProvider.user == null)
                    ? 0.toString()
                    : firebaseCrudProvider.user!.caparrots.length.toString(),
              ),
              Estadistics(
                name: 'Histories llegides',
                points: (firebaseCrudProvider.user == null)
                    ? 0.toString()
                    : firebaseCrudProvider.user!.biblioteca.length.toString(),
              ),
              Estadistics(
                name: 'Logros obtinguts',
                points: (firebaseCrudProvider.user == null)
                    ? 0.toString()
                    : firebaseCrudProvider.user!.logros.length.toString(),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MaterialButton(
                  padding: const EdgeInsets.all(8),
                  onPressed: _onLogOut,
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
