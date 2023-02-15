import 'package:caparrot/utils/palete.dart';
import 'package:flutter/material.dart';

class TypeTest extends StatefulWidget {
  const TypeTest({
    Key? key,
  }) : super(key: key);

  @override
  State<TypeTest> createState() => _TypeTestState();
}

class _TypeTestState extends State<TypeTest> {
  dynamic _value = '1990';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('1990'),
          leading: Radio<String>(
            value: '1990',
            groupValue: _value,
            onChanged: (String? value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('1865'),
          leading: Radio<String>(
            value: '1865',
            groupValue: _value,
            onChanged: (String? value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('2000'),
          leading: Radio<String>(
            value: '2000',
            groupValue: _value,
            onChanged: (String? value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('1992'),
          leading: Radio<String>(
            value: '1992',
            groupValue: _value,
            onChanged: (String? value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        MaterialButton(
          color: Palete.black50,
          textColor: Palete.white90,
          onPressed: () {
            if (_value == '1992') {
              print('Super okey');
            } else {
              print('okey');
            }
          },
          child: const Text('Enviar'),
        )
      ],
    );
  }
}
