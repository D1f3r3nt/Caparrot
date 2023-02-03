import 'package:caparrot/pages/pages.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes = {
  '/': (context) => HomePage(),
  'library': (context) => LibraryPage(),
  'heads': (context) => HeadPage(),
  'inventory': (context) => InventoryPage(),
};
