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
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.green,
                    Colors.yellow,
                  ],
                ),
              ),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://media.mallorca-touristguide.com/imagenes/321/principal%201.JPG'),
                                  fit: BoxFit.fill),
                            ),
                            margin: EdgeInsets.only(bottom: 30),
                          ),
                          TextFormField(
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (input) {
                              if (input!.isEmpty) {
                                return 'Introdueix els teus cognoms';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            onSaved: (input) => _email = input!,
                            decoration: InputDecoration(
                              labelText: 'Cognoms',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
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
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (input) {
                              if (input!.isEmpty) {
                                return 'Please enter an email';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => _email = input!,
                            decoration: InputDecoration(
                              labelText: 'Confirmar Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (input) {
                              if (input!.length < 6) {
                                return 'La clau ha de tenir com a minim 6 caracters';
                              }
                              return null;
                            },
                            onSaved: (input) => _password = input!,
                            decoration: InputDecoration(
                              labelText: 'Clau',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (input) {
                              if (input!.length < 6) {
                                return 'La clau ha de tenir com a minim 6 caracters';
                              }
                              return null;
                            },
                            onSaved: (input) => _password = input!,
                            decoration: InputDecoration(
                              labelText: 'Confirmar Clau',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            obscureText: true,
                          ),
                          MaterialButton(
                            color: Colors.lightBlueAccent,
                            onPressed: _submit,
                            child: Text(
                              'Registret',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_email);
      print(_password);
    }
  }
}
