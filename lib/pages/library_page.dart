import 'package:caparrot/utils/utils.dart';
import 'package:flutter/material.dart';

import '../widgets/card_library.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palete.green70,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.menu_book_rounded),
            SizedBox(width: 5),
            Text('Biblioteca')
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [CardLibrary()],
          ),
        ),
      ),
    );
  }
}
