import 'package:caparrot/provider/provider.dart';
import 'package:caparrot/utils/utils.dart';
import 'package:caparrot/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseCrudProvider = Provider.of<FirebaseCrudProvider>(context);
    firebaseCrudProvider.getLibrarys();

    return Scaffold(
      backgroundColor: Palete.green50,
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
        child: ListView(
          children: firebaseCrudProvider.librarys
              .map((library) => CardLibrary(
                    model: library,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
