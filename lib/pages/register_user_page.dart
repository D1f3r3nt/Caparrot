import 'package:caparrot/utils/utils.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RegisterPage();
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palete.green70,
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
              Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Introdueix el teu nom';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.name,
                          onSaved: (input) => _email = input!,
                          decoration: InputDecoration(
                            labelText: 'Nom',
                            labelStyle: TextStyle(
                              color: Palete.black50,
                              fontWeight: FontWeight.bold,
                            ),
                            errorStyle: TextStyle(color: Palete.white20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => _email = input!,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: TextFormField(
                          validator: (input) {
                            if (input!.length < 6) {
                              return 'La clau ha de tenir com a minim 6 caracters';
                            }
                            return null;
                          },
                          onSaved: (input) => _password = input!,
                          decoration: InputDecoration(
                            labelText: 'Clau',
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
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(height: 20),
                      MaterialButton(
                        color: Palete.black50,
                        onPressed: _submit,
                        child: const Text(
                          'Registret',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Palete.white20,
                indent: 10,
                endIndent: 10,
                thickness: 1,
              ),
              const SizedBox(height: 5),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Ya tens un compte? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Inicia sessió',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Palete.white20,
                      ),
                    ),
                  ],
                ),
                onTap: () => Navigator.pushReplacementNamed(context, 'login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }
}