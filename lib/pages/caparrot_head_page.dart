import 'package:caparrot/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CapaHeadPage extends StatelessWidget {
  const CapaHeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Grouxo"))),
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: [Colors.green, Colors.yellow],
              tileMode: TileMode.mirror,
            ),
          ),
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'GROUXO',
              style: TextStyle(
                  fontSize: 75.0, color: Color.fromRGBO(0, 0, 0, 0.368)),
            ),
          ),
        ),
        ModelViewer(
          backgroundColor: Color.fromRGBO(242, 236, 236, 0),
          src: 'assets/grouxo.glb', // a bundled asset file
          ar: false,
          autoRotate: true,
          cameraControls: true,
          disableZoom: true,
          disablePan: true,
        ),
      ]),
    );
  }
}
