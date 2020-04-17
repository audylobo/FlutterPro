import 'package:flutter/material.dart';

import '../../carousel_slider.dart';
import '../../font_awesome_flutter.dart';

class FishDetails extends StatefulWidget {
  final Map<String, dynamic> fishDetails;

  const FishDetails({Key key, this.fishDetails}) : super(key: key);

  @override
  _FishDetailsState createState() => _FishDetailsState();
}

class _FishDetailsState extends State<FishDetails> {
  double sheetTop = 400;
  double minSheetTop = 30;

  bool isExpanded = false;

  double sheetItemHeight = 110;
  double sheetItemDes = 300;

  int _current = 0;

  var innerMap;
  bool isMap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text("Lista de peces"),
          backgroundColor: Colors.black,
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 25),
              child: Icon(Icons.favorite_border),
            )
          ]),
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30),
            child: _pezTitle(),
          ),
          Container(
            width: double.infinity,
            child: _pezCarousel(),
          ),
          _customBottomSheet(),
        ],
      ),
    );
  }

  Widget _pezTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
              style: TextStyle(color: Colors.white, fontSize: 38),
              children: [
                TextSpan(text: widget.fishDetails['nombreEspecie']),
                TextSpan(text: "\n"),
                TextSpan(
                    text: widget.fishDetails['nombrePez'],
                    style: TextStyle(fontWeight: FontWeight.w700))
              ]),
        ),
        SizedBox(height: 10),
        RichText(
          text: TextSpan(style: TextStyle(fontSize: 16), children: [
            TextSpan(
                text: widget.fishDetails['continente'],
                style: TextStyle(color: Colors.grey[20])),
            TextSpan(
              text: "/ day",
              style: TextStyle(color: Colors.green),
            )
          ]),
        )
      ],
    );
  }

  Widget _pezCarousel() {
    final List<String> imgList = [
      widget.fishDetails['img'],
      widget.fishDetails['img']
    ];

    List<T> _map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
    }

    final List<Widget> child = _map<Widget>(imgList, (index, String asstName) {
      return Container(
        child: Image(image: NetworkImage(imgList[index]), fit: BoxFit.fitWidth),
      );
    }).toList();

    return Column(
      children: <Widget>[
        CarouselSlider(
            height: 250,
            viewportFraction: 1.0,
            items: child,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            }),
        Container(
          margin: EdgeInsets.only(left: 25),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: _map<Widget>(imgList, (index, assetName) {
                return Container(
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                      color: _current == index
                          ? Colors.grey[100]
                          : Colors.grey[600],
                    ));
              })),
        )
      ],
    );
  }

  Widget _customBottomSheet() {
    return Positioned(
      top: sheetTop,
      left: 0,
      child: GestureDetector(
        onTap: () {
          print(sheetTop);
          setState(() {
            isExpanded ? sheetTop = 400 : sheetTop = minSheetTop;
            isExpanded = !isExpanded;
          });
        },
        child: Container(
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
                flex: 1,
                child: ListView(
                  children: <Widget>[
                    detalle(),
                    mediciones(),
                    estiloDeVida(),
                    descripcion(),
                    SizedBox(height: 200),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget descripcion() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 40),
      child: Column(
        children: <Widget>[
          Text(
            "estilo de vida",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 10),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: sheetItemDes,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) {
                return listItem(
                    getFishList().descripcion[index], sheetItemDes);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget estiloDeVida() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 40),
      child: Column(
        children: <Widget>[
          Text(
            "estilo de vida",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 10),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: sheetItemHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return listItem(
                    getFishList().estiloDeVida[index], sheetItemHeight);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget mediciones() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 40),
      child: Column(
        children: <Widget>[
          Text(
            "mediciones",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 10),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: sheetItemHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return listItem(
                    getFishList().mediciones[index], sheetItemHeight);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget detalle() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 40),
      child: Column(
        children: <Widget>[
          Text(
            "Detalles",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 10),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            height: sheetItemHeight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return listItem(getFishList().detalle[index], sheetItemHeight);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget listItem(Map mapVal, double sheetItemHeight) {
    if (mapVal.values.elementAt(0) is Map) {
      innerMap = mapVal.values.elementAt(0);
      isMap = true;
    } else {
      innerMap = mapVal;
      isMap = false;
    }
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: sheetItemHeight,
      height: sheetItemHeight,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          mapVal.keys.elementAt(0),
          isMap
              ? Text(innerMap.keys.elementAt(0),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black, letterSpacing: 1.2, fontSize: 11))
              : Container(),
          Text(
            innerMap.values.elementAt(0),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
          )
        ],
      ),
    );
  }

  Peces1 getFishList() {
    double icoSize = 30;
    return new Peces1(detalle: [
      {
        Icon(Icons.favorite, size: icoSize, color: Colors.pink):
            "EDAD MAX: ${widget.fishDetails['detalle']['edadMax']} Años"
      },
      {
        Icon(FontAwesomeIcons.weightHanging, size: icoSize, color: Colors.blue):
            "Peso Max: ${widget.fishDetails['detalle']['pesoMax']} gramos"
      },
    ], mediciones: [
      {
        Icon(Icons.control_point, size: icoSize, color: Colors.green):
            "Tamaño Maximo: ${widget.fishDetails['mediciones']['tamanoMax']} cm"
      },
      {
        Icon(Icons.remove_circle_outline, size: icoSize, color: Colors.red):
            "Tamaño Minimo: ${widget.fishDetails['mediciones']['tamanoMin']} cm"
      },
    ], estiloDeVida: [
      {
        Icon(FontAwesomeIcons.temperatureHigh,
            size: icoSize,
            color: Colors.red): {"Temperatura maxima(upto)": widget.fishDetails['estiloVida']['tempMax'].toString()}
      },
      {
        Icon(FontAwesomeIcons.temperatureLow,
            size: icoSize,
            color: Colors.blue): {"temperatura minima(upto)": widget.fishDetails['estiloVida']['tempMin'].toString()}
      },
      {
        Icon(FontAwesomeIcons.tencentWeibo, size: icoSize, color: Colors.red): {
          "PH Maximo": widget.fishDetails['estiloVida']['phMax'].toString()
        }
      },
      {
        Icon(FontAwesomeIcons.tencentWeibo, size: icoSize, color: Colors.blue):
            {"PH Minimo": widget.fishDetails['estiloVida']['phMin'].toString()}
      },
    ], descripcion: [
      {
        Icon(FontAwesomeIcons.indent, size: icoSize, color: Colors.pink): {
          "Descripcion":
          widget.fishDetails['descripcion']
        }
      }
    ]);
  }
}

drawerHandle() {
  return Container(
    margin: EdgeInsets.only(bottom: 25),
    height: 3,
    width: 65,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: Color(0xffd9dbdb)),
  );
}

class Peces1 {
  List<Map<Icon, String>> detalle;
  List<Map<Icon, String>> mediciones;
  List<Map<Icon, Map<String, String>>> estiloDeVida;
  List<Map<Icon, Map<String, String>>> descripcion;

  Peces1({
    @required this.detalle,
    @required this.mediciones,
    @required this.estiloDeVida,
    @required this.descripcion,
  });
}
