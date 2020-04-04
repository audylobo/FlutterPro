import 'package:drawer_menu/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:drawer_menu/registro.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Auth service
  final AuthService _authService = AuthService();

  // Text fields state
  String email = '';
  String password = '';
  String error = '';

  bool _showPassword = false;

  // Form key
  final formkey = new GlobalKey<FormState>();


  void loginWithCredentials() {
    _authService.signEmailIn(email, password);
  }

  void loginWithProvider(String provider) {
    _authService.signInWithProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0.0),
            child: Image.asset(
              "assets/images/p.jpg",
              fit: BoxFit.cover,
              color: Colors.black54,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/Pez.png",
                height: 200.0,
                width: 200.0,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: 350.0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          autocorrect: false,
                          autofocus: false,
                          onChanged: (value) {
                            setState(() => email = value);
                          },
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle,
                                  color: Colors.green),
                              hintText: 'Correo',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              contentPadding: EdgeInsets.all(15.0)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          obscureText: !_showPassword,
                          autocorrect: false,
                          autofocus: false,
                          onChanged: (value) {
                            setState(() => password = value);
                          },
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.accessible, color: Colors.green),
                              hintText: 'Contraseña',
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              filled: true,
                              fillColor: Colors.white70,
                              contentPadding: EdgeInsets.all(15.0)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        MaterialButton(
                          color: Color.fromRGBO(11, 93, 73, 1),
                          minWidth: 300.0,
                          textColor: Colors.white,
                          child: Text('Entrar'),
                          onPressed: () {
                            loginWithCredentials();
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        MaterialButton(
                          color: Colors.red,
                          minWidth: 300.0,
                          textColor: Colors.white,
                          child: Text('Entrar con Google'),
                          onPressed: () {
                            loginWithProvider('google');
                          },
                        ),
                        MaterialButton(
                          color: Colors.blue[600],
                          minWidth: 300.0,
                          textColor: Colors.white,
                          child: Text('Entrar con Facebook'),
                          onPressed: () {
                            loginWithProvider('facebook');
                          },
                        ),
                        SizedBox(height: 20.0,),
                        MaterialButton(
                          color: Color.fromRGBO(11, 93, 73, 1),
                          minWidth: 300.0,
                          textColor: Colors.white,
                          child: Text('o Registrate ¡Aqui!'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Registro()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
