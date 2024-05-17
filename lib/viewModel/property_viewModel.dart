import 'package:flutter/material.dart';
import 'package:visanka/viewModel/city_viewModel.dart';
import 'package:visanka/models/onboardModel.dart';

class PropertyViewModel extends  CityViewModel {
  String  property = Property.property;
  List<String> properties =Property.properties;
  @override
  bool  onPressed = Property.press;

  Function (){
  return ( value){
  property = value!;
  if(property!=''){
  onPressed=true;
  }
  notifyListeners();
  };

  }



}