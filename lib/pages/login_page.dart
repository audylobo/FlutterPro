import 'package:drawer_menu/services/auth_service.dart';
import 'package:drawer_menu/services/push_service.dart';
import 'package:flutter/material.dart';
import 'package:drawer_menu/registro.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  bool _showPassword = true;

  // Form key
  final formkey = new GlobalKey<FormState>();

  bool isLoading = false;

  _onError(BuildContext context, dynamic error) {
    setState(() {
      isLoading = false;
    });
    print(error.code);
    Alert(context: context, title: "Error", desc: _authService.authErrorHandling(error)).show();
  }

  @override
  Widget build(BuildContext context) {

    final pushProvider = Provider.of<PushNotificationService>(context);

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
                    child: 
                    
                    isLoading ?

                    SpinKitCircle(
                      color: Colors.blue,
                      size: 100.0,
                    )
                    
                    :

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          autocorrect: false,
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
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
                            setState(() {
                              isLoading = true;
                            });
                            _authService.signEmailIn(email, password).catchError(
                              (error) => _onError(context, error)
                            );
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
                            setState(() {
                              isLoading = true;
                            });
                            _authService.signInWithGoogle(pushProvider.pushToken)
                            .catchError(
                              (error) => _onError(context, error)
                            );
                          },
                        ),
                        MaterialButton(
                          color: Colors.blue[600],
                          minWidth: 300.0,
                          textColor: Colors.white,
                          child: Text('Entrar con Facebook'),
                          onPressed: () {
                            _authService.signInWithFacebook(pushProvider.pushToken).catchError(
                              (error) => _onError(context, error)
                            );
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
