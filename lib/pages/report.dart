import 'package:flutter/material.dart';

class Report extends StatelessWidget{
  static const String routeName = "/report";
    final _formKey = GlobalKey<FormState>();
  @override
 
  Widget build(BuildContext context){
  return Scaffold(
     appBar: new AppBar(
        title: new Text("Reportes"), 
         backgroundColor: Colors.lightGreen,
        ),
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
                     
               Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // devolverá true si el formulario es válido, o falso si
                // el formulario no es válido.
                if (_formKey.currentState.validate()) {
                  // Si el formulario es válido, queremos mostrar un Snackbar
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
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