

import 'package:flutter/cupertino.dart';
import 'package:visanka/models/home_model.dart';

class DashBoardviewModel extends ChangeNotifier {
  List items = DashBoardModel.items;
  List states=DashBoardModel.states;
  List categories=DashBoardModel.categoryItems;
  List categoriesStates=DashBoardModel.categoryStates;
  List number=DashBoardModel.number;

  String numberProperties= '__';
  List<String> propertyTypes =DashBoardModel.properties;
  List propertyStates=DashBoardModel.propertyStates;

 changeState(int index) {
   for (int i = 0; i < states.length; i++) {
     states[i] = (i == index);
   }

   notifyListeners();
 }
 category(int index) {
    for (int i = 0; i < categoriesStates.length; i++) {
      categoriesStates[i] = (i == index);
    }

    numberProperties= number[index];

//this function manges the state of category feature , it also makes a request to the db to get the exact number of properties
    notifyListeners();
  }
  toggleProperty(int index){

    for (int i = 0; i < propertyStates.length; i++) {
      propertyStates[i] = (i == index);
    }
notifyListeners();
    //this function manges the state of property type feature , it also filters results as per type
  }



}
