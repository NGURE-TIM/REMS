

import 'package:flutter/cupertino.dart';
import 'package:visanka/models/home_model.dart';

class DashBoardviewModel extends ChangeNotifier {
  int listing=DashBoardModel.listing;
  int newListing =DashBoardModel.newListing;
  List items = DashBoardModel.items;
  List states=DashBoardModel.states;
  List categories=DashBoardModel.categoryItems;
  List categoriesStates=DashBoardModel.categoryStates;
  List number=DashBoardModel.number;

  String numberProperties= '__';//placeholder


  List<String> propertyTypes =DashBoardModel.properties;
  List propertyStates=DashBoardModel.propertyStates;
  List numberOfProperties=DashBoardModel.numberOfProperties;

  bool searchButtonState=DashBoardModel.searchButtonState;

  double highestValue = DashBoardModel.highestValue;
  double lowestValue = DashBoardModel.lowestValue;


  List<String> bedrooms=DashBoardModel.bedrooms;
  List<String> bathrooms=DashBoardModel.bathrooms;

  List<String> popularFeatures=DashBoardModel.popularFeatures;
  List<String> features=DashBoardModel.featuredAmenities;


  List<Unit> unit =DashBoardModel.units;


 changeState(int index) {
   for (int i = 0; i < states.length; i++) {
     states[i] = (i == index);
   }

   notifyListeners();
 }
 togglePreference(int index) {
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
    numberProperties= numberOfProperties[index];
    notifyListeners();
    //this function manges the state of property type feature , it also filters results as per type
  }

  showButtonLoading()async{
   searchButtonState=!searchButtonState;
   await Future.delayed(Duration(seconds: 4));
   searchButtonState=!searchButtonState;
   notifyListeners();
  }
   updatePrice(lowerValue ,upperLimit ){
   highestValue=upperLimit;
   lowestValue=lowerValue;
   notifyListeners();
   }


   //todo:implement a function  to filter as per beds and baths  and change state of the buttons
//todo:implement a function  to filter as per features



}
