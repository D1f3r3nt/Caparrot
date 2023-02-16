import 'package:caparrot/main.dart';
import 'package:caparrot/provider/provider.dart';
import 'package:flutter/material.dart';

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => MusicProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => FirebaseCrudProvider()),
        ChangeNotifierProvider(create: (_) => MarkerProvider())
      ],
      child: const MyApp(),
    );
  }
}
