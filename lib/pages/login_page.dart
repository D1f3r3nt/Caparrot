import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
                            if (input!.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          onSaved: (input) => _password = input!,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          obscureText: true,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Has olvidad la teva clau?",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.lightBlueAccent,
                          onPressed: _submit,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text('Altres opcions de login'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: Icon(Icons.home),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.person),
                              onPressed: () {},
                            ),
                          ],
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
