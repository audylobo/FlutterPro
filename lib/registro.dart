import 'package:drawer_menu/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Registro extends StatefulWidget {
  static const String routeName = "/registro";
  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool _showPassword = false;
  final scaffolkey = new GlobalKey<ScaffoldState>();
  final _formkey = new GlobalKey<FormState>();

  AuthService _authService = AuthService();

  RegisterData user = RegisterData(
      name: '',
      lastName: '',
      email: '',
      password: '',
      confirmPassword: '',
      phone: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffolkey,
      appBar: new AppBar(
        title: new Text(widget.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: 
        
          isLoading ? 
          
            SpinKitCircle(
              color: Colors.blue,
              size: 100.0,
            )
            
            : 
            
            Form(
                key: _formkey,
                child: ListView(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      validator: (value) => value.isEmpty
                          ? 'Ingresa tu nombre'
                          : value.length < 5
                              ? 'Ingresa un nombre valido'
                              : null,
                      onChanged: (value) {
                        setState(() => user.name = value);
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.account_circle, color: Colors.green),
                        labelText: 'Nombre',
                        hintText: 'Escribe tu nombre',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      validator: (value) => value.isEmpty
                          ? 'Ingresa tu apellido'
                          : value.length < 5
                              ? 'Ingresa un apellido valido'
                              : null,
                      onChanged: (value) {
                        setState(() => user.lastName = value);
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.font_download, color: Colors.green),
                        labelText: 'Apellido',
                        hintText: 'Escribe tu Apellido ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      validator: (value) => validateEmail(value),
                      onChanged: (value) {
                        setState(() => user.email = value);
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.green),
                        labelText: 'Correo',
                        hintText: 'Escribe tu correo',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      obscureText: !_showPassword,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Este campo no puede esta vacio';
                        }
                        if (value.length < 8) {
                          return 'La contraseña debe tener como minimo 8 caracteres';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() => user.password = value);
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.accessibility, color: Colors.green),
                        labelText: 'Nueva Contraseña',
                        hintText: 'Escribe tu nueva contraseña',
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      obscureText: !_showPassword,
                      onChanged: (value) {
                        setState(() => user.confirmPassword = value);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Este campo no puede esta vacio';
                        }
                        if (value != user.password) {
                          return 'Las contraseñas no coinciden';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.accessibility_new, color: Colors.green),
                        labelText: 'Ingrese Nuevamente Contraseña',
                        hintText: 'Escribe Nuevamente contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'el campo esta vacio';
                        }
                        if (RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return "caracteres invalidos";
                        }
                        if (value.length < 10)
                          return "Numero de telefono incorrecto";
                        return null;
                      },
                      onChanged: (value) {
                        setState(() => user.phone = value);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.phone_iphone, color: Colors.green),
                        labelText: 'telefono',
                        hintText: 'Escribe tu Numero',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      child: Text("ENVIAR DATOS"),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {                        
                        if (_formkey.currentState.validate()) {
                          setState(() {
                            isLoading = true;
                          });                          
                          _authService
                              .signUpEmail(user)
                              .then((onValue) =>                                 
                                Alert(context: context, type: AlertType.success, title: "Cuenta creada con exito", buttons: [DialogButton(child: Text('Ok'), onPressed: () {Navigator.pop(context);})]).show()
                              )
                              .catchError(
                                  (error) => 
                                    Alert(context: context,  type: AlertType.error, title: "Error", desc: _authService.authErrorHandling(error)).show().then((onValue) => setState(() => isLoading = false)) 
                                  );
                        }
                      })
                ]),
              ),
      ),
    );
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Ingresa un correo electronico valido';
    else
      return null;
  }
}
