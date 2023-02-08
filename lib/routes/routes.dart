import 'package:caparrot/pages/pages.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes = {
  '/': (context) => Gateway(),
  'home': (context) => HomePage(),
  'library': (context) => LibraryPage(),
  'heads': (context) => HeadPage(),
  'inventory': (context) => InventoryPage(),
  'login': (context) => LoginPage(),
  'profile': (context) => ProfileScreen(),
  'register': (context) => RegisterPage(),
  'new_password': (context) => NewPassword(),
  'settings': (context) => Settings(),
};
