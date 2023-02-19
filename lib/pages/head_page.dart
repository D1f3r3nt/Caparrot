import 'package:caparrot/provider/head_provider.dart';
import 'package:caparrot/provider/provider.dart';
import 'package:caparrot/utils/utils.dart';
import 'package:caparrot/widgets/caparrot_card_simple.dart';
import 'package:flutter/material.dart';

class HeadPage extends StatelessWidget {
  const HeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    var headProvider = Provider.of<HeadProvider>(context);
    var firebaseCrudProvider = Provider.of<FirebaseCrudProvider>(context);

    return Scaffold(
      backgroundColor: Palete.black50,
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
      body: ListView(
        children: headProvider.heads
            .map(
              (e) => CapaTag(
                model: e,
                enable: firebaseCrudProvider.user!.caparrots.contains(e.id),
              ),
            )
            .toList(),
      ),
    );
  }
}
