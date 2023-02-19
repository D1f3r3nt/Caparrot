import 'package:caparrot/models/head_model.dart';
import 'package:caparrot/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CapaHeadPage extends StatelessWidget {
  late HeadModel headModel;
  CapaHeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    headModel = ModalRoute.of(context)!.settings.arguments as HeadModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palete.green70,
        title: Text(headModel.name),
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: const Alignment(0.8, 1),
              colors: [Palete.green50, Palete.black50],
              tileMode: TileMode.mirror,
            ),
          ),
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              headModel.name.toUpperCase(),
              style: TextStyle(
                fontSize: 75.0,
                color: Palete.black90,
              ),
            ),
          ),
        ),
        ModelViewer(
          src: 'assets/modelos3d/${headModel.tresD}', // a bundled asset file
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
