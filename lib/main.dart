import 'package:caparrot/pages/pages.dart';
import 'package:caparrot/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Caparrots',
      initialRoute: 'createuser',
      routes: getRoutes,
    );
  }
}
