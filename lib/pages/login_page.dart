import 'package:caparrot/provider/provider.dart';
import 'package:caparrot/utils/palete.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  late AppLifecycleState appLifecycleState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    appLifecycleState = state;
    setState(() {});
    super.didChangeAppLifecycleState(state);
    var musicProvider = Provider.of<MusicProvider>(context, listen: false);

    //
    if (state == AppLifecycleState.paused) {
      musicProvider.pauseMusic();
    }

    if (state == AppLifecycleState.resumed) {
      musicProvider.resumeMusic();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    Provider.of<MusicProvider>(context).play();
    Provider.of<FirebaseCrudProvider>(context).logout();
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    void _onSubmitLogIn() {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        authProvider.emailLogin(context, email: _email, password: _password);
      }
    }

    void _onGoogleLogIn() {
      authProvider.googleLogin(context);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Benvingut',
                style: TextStyle(
                    color: Palete.white20,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, 'new_password'),
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
                    const SizedBox(height: 20),
                    MaterialButton(
                      color: Palete.black50,
                      onPressed: _onSubmitLogIn,
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Palete.white20, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                  color: Palete.white20,
                  indent: 10,
                  endIndent: 10,
                  thickness: 1),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MaterialButton(
                  color: Palete.black50,
                  onPressed: _onGoogleLogIn,
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
              const SizedBox(height: 5),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "No tens cap compte? ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Registret',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Palete.white20,
                      ),
                    ),
                  ],
                ),
                onTap: () =>
                    Navigator.pushReplacementNamed(context, 'register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
