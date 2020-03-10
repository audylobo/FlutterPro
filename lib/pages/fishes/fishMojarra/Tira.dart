import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:drawer_menu/carousel_slider.dart';
import 'package:drawer_menu/font_awesome_flutter.dart';

void mojatira() => runApp(MojarraTira());
var currentCar = pezList.fishs[0];

class MojarraTira extends StatelessWidget{

@override
  Widget build(BuildContext context){

    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MojaTi(),
    );  }
}

class MojaTi extends StatelessWidget{
  static const String routeName = "/peces";
  @override
  Widget build(BuildContext context){
    return new Scaffold(
     appBar: new AppBar(
        title: new Text("Lista de peces"),
         backgroundColor: Colors.black,
         actions: <Widget>[
          Container(margin: EdgeInsets.only(right:25),
          child: Icon(Icons.favorite_border),
          )
        ]
        ),
      
          backgroundColor: Colors.black,
          body:LayoutStarts(),);
  }
}

class LayoutStarts extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Stack(children: <Widget>[
      PezDetalle(),
      CustomBottomSheet()],
    );
  }
}

class PezDetalle extends StatefulWidget{
  @override _PezDetalleState createState() =>  _PezDetalleState ();
}
class _PezDetalleState extends State<PezDetalle>{
  @override
  Widget build(BuildContext context){
    return PeezDetalle();
  }
}
class PeezDetalle extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30),
            child: _pezTitle(),),
          Container(
            width: double.infinity,
            child: PezCarousel(),
          )
        ],
      )
    );
      }
}

class PezCarousel extends StatefulWidget{
  @override
  _PezCarouselState createState() => _PezCarouselState();
}
class _PezCarouselState extends State<PezCarousel>{

  static final List<String> imgList = currentCar.imglist;

  final List<Widget> child = _map<Widget>(imgList,(index, String asstName){
    return Container(
      child: Image.asset(  'assets/images/Mojarra_tira.png', fit: BoxFit.fitWidth),
     //  child1: Image.asset(  'assets/images/Amarillo.png', fit: BoxFit.fitWidth)
      );
  }).toList();

static List<T> _map<T> (List list, Function handler) {

List<T> result = [];
for (var i = 0; i < list.length; i++){
  result.add(handler(i, list[i]));

}
return result;
}

int _current =0;

@override Widget build(BuildContext context){
  return Container(
    child: Column(
      children: <Widget>[
        CarouselSlider(
          height:250,
          viewportFraction: 1.0,
          items: child,
          onPageChanged: (index){
            setState(() {
              _current = index;
            });
          }
        ),
      Container(
        margin: EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _map<Widget>(imgList,(index, assetName){
            return Container(
              width:50,
              height:2,
              decoration: BoxDecoration(
                color: _current == index ? Colors.grey[100] : Colors.grey [600],
              )
            );
          }
          )
        ),
      )
    ],
    ),
  );
}
}
_pezTitle(){
  return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
  RichText(text:TextSpan(
    style: TextStyle(color: Colors.white, fontSize: 38),
    children: [
      TextSpan(text: currentCar.nombreEspecie),
      TextSpan(text: "\n"),
      TextSpan(
        text: currentCar.nombrePez,
        style: TextStyle(fontWeight: FontWeight.w700))]),
  ), SizedBox(height: 10),
RichText(
  text: TextSpan(
    style: TextStyle(fontSize: 16),
    children: [
      TextSpan(
      text: currentCar.pais.toString(),
      style: TextStyle(color: Colors.grey[20])
      ),TextSpan(text: "/ day", style: TextStyle(color: Colors.green),
  )
    ]
  ),
)
],
  );
}
class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  double sheetTop = 400;
  double minSheetTop =30;

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: sheetTop,
      left:0,
      child: GestureDetector(onTap: () {
        setState(() {
        isExpanded ? sheetTop = 400 :sheetTop = minSheetTop;
        isExpanded = !isExpanded;

        });
      },
      child: SheetContainer(),
      ),
    );
  }
}

class  SheetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sheetItemHeight = 110;
    double sheetItemDes = 300;

    return Container(
      padding: EdgeInsets.only(top: 25),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        color: Color(0xfff1f1f1)),
      child: Column(
        children: <Widget>[
          drawerHandle(),
          Expanded(
            flex:1,
            child: ListView(
              children: <Widget>[
                detalle(sheetItemHeight),
                mediciones(sheetItemHeight),
                estiloDeVida(sheetItemHeight),
                descripcion(sheetItemDes),
                SizedBox(height: 200),
              ],
            ),
          )
        ],
      ),
    );
  }
}
drawerHandle(){
  return Container(
    margin: EdgeInsets.only(bottom: 25),
    height: 3,
    width: 65,
    decoration: BoxDecoration(
      borderRadius:  BorderRadius.circular(15),
      color: Color(0xffd9dbdb)
    ),
  );
}
descripcion(double sheetItemHeight){
  return Container (
    padding: EdgeInsets.only(top:15, left:40),
    child: Column(children: <Widget>[
      Text(
        "estilo de vida",
        style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 10
        ),
      ),
Container(
  margin: EdgeInsets.only(top: 15),
  height: sheetItemHeight ,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: currentCar.descripcion.length,
    itemBuilder: (context, index){
    return ListItem(
      sheetItemHeight : sheetItemHeight,
      mapVal: currentCar.descripcion[index]
             );
           },

         ),
       )
     ],
    ),
  );

}
estiloDeVida(double sheetItemHeight){
return Container (
    padding: EdgeInsets.only(top:15, left:40),
    child: Column(children: <Widget>[
      Text(
        "estilo de vida",
        style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 10
        ),
      ),
Container(
  margin: EdgeInsets.only(top: 15),
  height: sheetItemHeight ,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: currentCar.estiloDeVida.length,
    itemBuilder: (context, index){
    return ListItem(
      sheetItemHeight : sheetItemHeight,
      mapVal: currentCar.estiloDeVida[index]
             );
           },

         ),
       )
     ],
    ),
  );

}
mediciones(double sheetItemHeight){
  return Container (
    padding: EdgeInsets.only(top:15, left:40),
    child: Column(children: <Widget>[
      Text(
        "mediciones",
        style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 10
        ),
      ),
Container(
  margin: EdgeInsets.only(top: 15),
  height: sheetItemHeight ,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: currentCar.mediciones.length,
    itemBuilder: (context, index){
    return ListItem(
      sheetItemHeight : sheetItemHeight,
      mapVal: currentCar.mediciones[index]
             );
           },

         ),
       )
     ],
    ),
  );
}
detalle (double sheetItemHeight){
  return Container (
    padding: EdgeInsets.only(top:15, left:40),
    child: Column(children: <Widget>[
      Text(
        "Detalles",
        style: TextStyle(color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 10
        ),
      ),
Container(
  margin: EdgeInsets.only(top: 15),
  height: sheetItemHeight ,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: currentCar.detalle.length,
    itemBuilder: (context, index){
    return ListItem(
      sheetItemHeight : sheetItemHeight,
      mapVal: currentCar.detalle[index]
             );
           },

         ),
       )
     ],
    ),
  );
}
class ListItem extends StatelessWidget {

  final double sheetItemHeight;
  final Map  mapVal;
  
  ListItem({
    this.mapVal,
    this.sheetItemHeight
  });
  @override
  Widget build(BuildContext context) {
    var innerMap;
    bool isMap;

    if (mapVal.values.elementAt(0) is Map){
      innerMap = mapVal.values.elementAt(0);
      isMap = true;

    }else{
      innerMap = mapVal;
      isMap= false;
    }
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: sheetItemHeight,
      height: sheetItemHeight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center ,
        children: <Widget>[
          mapVal.keys.elementAt(0),

isMap ? Text(innerMap.keys.elementAt(0), textAlign: TextAlign.center, 
style: TextStyle(color: Colors.black, letterSpacing: 1.2, fontSize: 11)) 
: Container (),
          
          Text(
            innerMap.values.elementAt(0),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15
            ),
          )
        ],
      ),
    );
  }
}


double icoSize = 30;

PezList pezList = PezList( fishs: [
  
  Peces1(nombreEspecie: "Mojarra Tira", nombrePez: "Diplodus vulgaris", pais:"Colombia", imglist: [

    'assets/images/Mojarra_tira.png',
  ], detalle:[

    {Icon(Icons.favorite, size: icoSize, color: Colors.pink):"EDAD MAX: 3 Años"},
    {Icon(FontAwesomeIcons.weightHanging, size: icoSize, color: Colors.blue):"Peso Max: 15 gramos"},

  ],mediciones: [
    {Icon(Icons.control_point, size: icoSize, color: Colors.green):"Tamaño Maximo: 41 cm"},
    {Icon(Icons.remove_circle_outline, size:icoSize, color: Colors.red):"Tamaño Minimo: 20 cm"},

  ],estiloDeVida: [
    {Icon(FontAwesomeIcons.temperatureHigh, size:icoSize, color:Colors.red):{"Temperatura maxima(upto)": "20 "}},
    {Icon(FontAwesomeIcons.temperatureLow, size: icoSize, color: Colors.blue):{"temperatura minima(upto)" :"15"}},
    {Icon(FontAwesomeIcons.tencentWeibo, size: icoSize, color: Colors.red):{"PH Maximo":"8"}},
    {Icon(FontAwesomeIcons.tencentWeibo, size: icoSize, color: Colors.blue):{"PH Minimo":"6"}},

  ],descripcion: [
   {Icon(FontAwesomeIcons.indent, size: icoSize, color: Colors.pink):{"Descripcion": "Son peces pequeños de cuerpo ovalado de color plata y aplanados lateralmente, cuya boca es protuberante. Aunque su cabeza presenta muchas escamas, es suave al tacto. Posee aleta dorsal alargada y también anal de escamas en la base, las mismas presentan radios duros y blancos. "}}
  ]
  ),
]);

class PezList {
  List<Peces1> fishs;

  PezList({
    @required this.fishs

  });


}

class  Peces1 {

String nombreEspecie;
String nombrePez;
String pais;

List<String> imglist;
List<Map<Icon,String>> detalle;
List<Map<Icon,String>> mediciones;
List<Map<Icon, Map<String, String>>> estiloDeVida;
List<Map<Icon,Map<String, String>>> descripcion;

Peces1({
@required this.nombreEspecie,
@required this.nombrePez,
@required this.pais,
@required this.imglist,
@required this.detalle,
@required this.mediciones,
@required this.estiloDeVida,
@required this.descripcion,
});
}
// pes 2 //bin