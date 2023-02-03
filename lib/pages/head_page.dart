import 'package:caparrot/utils/utils.dart';
import 'package:flutter/material.dart';

class HeadPage extends StatelessWidget {
  const HeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palete.green70,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.face),
            SizedBox(width: 5),
            Text('Caparrots')
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
