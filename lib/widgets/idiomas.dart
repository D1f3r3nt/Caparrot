import 'package:flutter/material.dart';

const List<String> list = <String>['Español', 'English', 'Catala', 'Deustch'];

class Idiomas extends StatefulWidget {
  @override
  State<Idiomas> createState() => _IdiomasState();
}

class _IdiomasState extends State<Idiomas> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
