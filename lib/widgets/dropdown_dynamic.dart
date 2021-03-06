import 'package:cached_network_image/cached_network_image.dart';
import 'package:drawer_menu/models/fish.dart';
import 'package:flutter/material.dart';

import 'container/container_blue.dart';

class DynamicCustomDropwDownList extends StatelessWidget {
  DynamicCustomDropwDownList({
    @required this.snapshot,
    @required this.textMostrado,
    @required this.functionChange,
  });
  final List<dynamic> snapshot;

  final String textMostrado;
  final Function functionChange;

  @override
  Widget build(BuildContext context) {
    return ContainerBlue(
        child: Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: DropdownButton<dynamic>(
        itemHeight: 50,
        style: TextStyle(color: Colors.black),
        items: snapshot
            .map((data) => DropdownMenuItem<dynamic>(
                  child: dataReferencia(data),
                
                  value: data,
                ))
            .toList(),
        onChanged: (dynamic value) {
          functionChange(value);
        },
        
      
        isExpanded: true,
        hint: Text(
          textMostrado,
          style: TextStyle(fontSize: 16),
        ),
        icon: Icon(Icons.arrow_downward),
      ),
    ));
  }

  Widget dataReferencia(dynamic data) {

    if (data is FishListOrigin) {
      return Text(data.categoria);
    } else if (data is DetailFishModel){
      return Text(data.nombrePez);
    
    }else {
      return Text(data.referencia);
    


    }



    
  }

  Widget fishImg() {}
}
