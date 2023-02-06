import 'package:caparrot/utils/palete.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          child: Form(
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
                    onSaved: (input) => _email = input!,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Palete.white90,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    validator: (input) {
                      if (input!.length < 6) {
                        return 'La contrasenya ha de contenir un minim de 6 caracters';
                      }
                      return null;
                    },
                    onSaved: (input) => _password = input!,
                    decoration: InputDecoration(
                      labelText: 'Contrasenya',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Palete.white90,
                      focusColor: Palete.green90,
                      hoverColor: Palete.green90,
                    ),
                    obscureText: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Has olvidad la teva clau?",
                          style: TextStyle(
                            color: Palete.white20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                MaterialButton(
                  color: Palete.black50,
                  onPressed: _submit,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Palete.white20),
                  ),
                ),
                Divider(
                  color: Palete.white20,
                  indent: 10,
                  endIndent: 10,
                  thickness: 1,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    color: Palete.black50,
                    onPressed: _submit,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.google,
                          color: Palete.white20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Log in with Google',
                          style: TextStyle(color: Palete.white20, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(text: "No tens cap compte? "),
                      TextSpan(
                        text: 'Registret',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor),
                      ),
                    ])),
                  ),
                  onTap: () {
                    print('ok');
                  },
                ),
              ],
            ),
          ),
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
