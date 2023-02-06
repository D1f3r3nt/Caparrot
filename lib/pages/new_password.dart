import 'package:caparrot/firebase/firebase.dart';
import 'package:caparrot/utils/utils.dart';
import 'package:flutter/material.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    late String _email;

    return Scaffold(
      backgroundColor: Palete.green70,
      appBar: AppBar(
        backgroundColor: Palete.green90,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/escudo.png'),
                fit: BoxFit.cover,
                opacity: 0.5),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Recuperar contrasenya',
                style: TextStyle(
                    color: Palete.white20,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Perfavor posa un email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (input) => _email = input,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Palete.black50,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorStyle: TextStyle(color: Palete.white20),
                          filled: true,
                          fillColor: Palete.white90,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Palete.green70,
                                width: 3,
                                strokeAlign: StrokeAlign.center),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: Palete.green50,
                                strokeAlign: StrokeAlign.center),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      color: Palete.black50,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          EmailAuth.newPassword(context, email: _email);
                        }
                      },
                      child: Text(
                        'Send It',
                        style: TextStyle(color: Palete.white20, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
