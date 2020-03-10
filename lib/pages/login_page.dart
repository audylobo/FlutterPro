import 'package:flutter/material.dart';
import 'package:drawer_menu/fishprincipal.dart';
import 'package:drawer_menu/font_awesome_flutter.dart';
import 'package:drawer_menu/registro.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = "/MyHomePage";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showPassword = false;
  final formkey = new GlobalKey <FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(0.0),
        child:Image.asset("assets/images/p.jpg",
         fit: BoxFit.cover,
          color: Colors.black54,
           colorBlendMode: BlendMode.darken,
          ),
        ),
          Column(
          mainAxisAlignment: MainAxisAlignment.center,  
          children: <Widget>[
            Image.asset("assets/images/Pez.png",
            height: 260.0,
            width: 270.0,
            ),
           
            Stack(
            children: <Widget>[
              Container(
                height:370.0,
                width: 350.0,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 25.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                        vertical: 25.0,
                      ),
                   child: TextField(
                      autocorrect: false,
                      autofocus: false,
                      style: TextStyle(
                        fontSize:20.0,
                      ),
                      decoration: InputDecoration(
                               prefixIcon: Icon(Icons.account_circle, color: Colors.green),
                               
                               hintText: 'Correo',
                               border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                               
                               ),
                               filled: true,
                               fillColor: Colors.white70,
                               contentPadding: EdgeInsets.all(15.0)
                      ),
                      ),
                       ),
                      TextField(
                        obscureText: !_showPassword,
                      autocorrect: false,
                      autofocus: false,
                      style: TextStyle(
                        fontSize:20.0,
                      ),
                      decoration: InputDecoration(
                               prefixIcon: Icon(Icons.accessible, color: Colors.green),
                               
                               hintText: 'Contraseña',
                               suffixIcon: GestureDetector( 
       onTap: (){
         setState(() {
           _showPassword = !_showPassword;

         });

       },
       child: Icon(
         _showPassword ? Icons.visibility : Icons.visibility_off,
       ),
      ),
                               border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                               
                               ),
                               filled: true,
                               fillColor: Colors.white70,
                               contentPadding: EdgeInsets.all(15.0)
                      ),
                      ),
MaterialButton(
               
                   color: Color.fromRGBO(11, 93, 73, 1),
       textColor: Colors.white,
       child: Text('entrar'),  
                  onPressed:(){
              Navigator.push(
                context,
              new MaterialPageRoute(builder: (context) => new FishPrincipal()));
            },
                ),

                
                MaterialButton(
               
                   color: Color.fromRGBO(11, 93, 73, 1),
       textColor: Colors.white,
       child: Text('Registrate'),  
                  onPressed:(){
              Navigator.push(
                context,
              new MaterialPageRoute(builder: (context) => new Registro()));
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