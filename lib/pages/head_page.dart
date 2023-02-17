import 'package:caparrot/utils/utils.dart';
import 'package:caparrot/widgets/caparrot_card_simple.dart';
import 'package:flutter/material.dart';

class HeadPage extends StatelessWidget {
  const HeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palete.black50,
      appBar: AppBar(
        title: const Center(child: Text("Caparrots")),
      ),
      body: ListView(
        children: [
          CapaTag(
            url: "https://ponsport.com/wp-content/uploads/2016/12/008-1.png",
            nom: "Groucho",
          ),
          Divider(),
        ],
      ),
    );
  }
}
