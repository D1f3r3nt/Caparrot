import 'package:caparrot/utils/utils.dart';
import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palete.green70,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.inventory),
            SizedBox(width: 5),
            Text('Inventari')
          ],
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text('Hola'),
        ),
      ),
    );
  }
}
