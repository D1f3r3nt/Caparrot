import 'package:caparrot/provider/provider.dart';
import 'package:caparrot/routes/routes.dart';
import 'package:caparrot/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  /* Para evitar que la pantalla se voltee */
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /*Para el auth*/
  await Firebase.initializeApp();
  await FirebaseAuth.instance;

  runApp(AppState());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caparrots',
      initialRoute: '/',
      routes: getRoutes,
    );
  }
}
