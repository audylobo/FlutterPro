
import 'package:drawer_menu/models/listFishLake.dart';
import 'package:drawer_menu/pages/lakes/provider/fish_detail_provider.dart';
import 'package:drawer_menu/pages/lakes/provider/sensores_providers.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:provider/provider.dart';

class ControllerAddFishListLake {


  void agregarPez(BuildContext context/* , ListFishLakeProvider myFishList,
      DateProvider myDatePick, FishDetailProvider myFishPress, */ ,SensorProvidersData normalData) {

    final myFishList = Provider.of<ListFishLakeProvider>(context,listen:false); 
    final myDatePick = Provider.of<DateProvider        >(context,listen:false);
    final myFishPress = Provider.of<FishDetailProvider >(context,listen:false); 

        if (myDatePick.getDate != null && myFishPress.detallePez!= null ){

          ListFishLake fish= new ListFishLake();
          //DetailFishModel myDetailFish = new DetailFishModel();
          fish.fecha= myDatePick.getDate;
          fish.cantidadPeces= int.parse(normalData.cantidadPeces.text.trim());
       
          fish.pez = myFishPress.detallePez;
       
         myFishList.setListFishLake = fish;
         print(myFishList.getListFish);
        }else{
          print("ELSE");
          print(myDatePick.getDate);
          print(normalData.cantidadPeces.text.trim());
          print(myFishPress.detallePez);



        }


  }


  void eliminarPez(BuildContext context,int index){
  final myFishList = Provider.of<ListFishLakeProvider>(context,listen:false); 

  
  myFishList.deletePez(index);


  }




}
