

import 'package:visanka/models/onboard_model.dart';

class DashBoardModel extends Property {
 static List<String> items =['Preference', 'Property Type', 'Price', 'Beds & Baths ', 'Features'];
 static List<bool> states = List.generate(5, (index) => false);
 static List<String> categoryItems =['Buy' , 'Rent'];
 static List<bool> categoryStates = List.generate(2, (index) => false);
 static List<String> number =['200', '750'];//example values  pulled from db
 static List<String> properties=Property.properties;
 static List<bool> propertyStates = List.generate(Property.properties.length, (index) => false);

}