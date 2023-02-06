import 'package:caparrot/pages/pages.dart';
import 'package:caparrot/pages/register_user_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes = {
  '/': (context) => HomePage(),
  'library': (context) => LibraryPage(),
  'heads': (context) => HeadPage(),
  'inventory': (context) => InventoryPage(),
  'login': (context) => LoginPage(),
  'profile': (context) => ProfileScreen(),
  'createuser': (context) => RegisterPage(),
};
