import 'package:caparrot/models/head_model.dart';
import 'package:caparrot/provider/provider.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';

class TypeTest extends StatefulWidget {
  final HeadModel model;
  const TypeTest({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<TypeTest> createState() => _TypeTestState();
}

class _TypeTestState extends State<TypeTest> {
  dynamic _value = '0';

  @override
  Widget build(BuildContext context) {
    var firebaseCrudProvider = Provider.of<FirebaseCrudProvider>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...widget.model.respuestas
            .map((r) => ListTile(
                  title: Text(r),
                  leading: Radio<String>(
                    value: widget.model.respuestas.indexOf(r).toString(),
                    groupValue: _value,
                    onChanged: (String? value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ))
            .toList(),
        const SizedBox(height: 10),
        MaterialButton(
          color: Palete.black50,
          textColor: Palete.white90,
          onPressed: () {
            if (_value == widget.model.indexRespuesta.toString()) {
              firebaseCrudProvider.addHead(widget.model);
              Snackbar.correctSnackbar(context, 'Caparrot obtenido');
            } else {
              Snackbar.errorSnackbar(context, 'Has fallado');
            }
            Navigator.pop(context);
            popUpContinue(context, widget.model);
          },
          child: const Text('Enviar'),
        )
      ],
    );
  }
}
