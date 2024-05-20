import 'package:visanka/models/onboard_model.dart';
import 'package:flutter/cupertino.dart';

class CityViewModel extends ChangeNotifier {
bool  onPressed = City.press;
 String  city = City.city;
 List<String> cities = City.cities;

Function (){
return ( value){

city = value!;
if(city!=''){
onPressed=true;

}
notifyListeners();
};

}
}