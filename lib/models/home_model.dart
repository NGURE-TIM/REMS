

import 'dart:math';

import 'package:visanka/models/onboard_model.dart';



class DashBoardModel extends Property {

 static  String selectedSort='Featured';
 static List <String> sortItems=['Featured','Newest','Price(low)','Price(high)','Verified agents'];
 static int listing =1750; // all properties currently in the database
 static int newListing =17; // all new properties currently in the database
 static List<String> items =['Preference', 'Property Type', 'Price', 'Beds & Baths ', 'Features',];
 static List<bool> states = List.generate(5, (index) => false);
 static List<String> categoryItems =['Buy' , 'Rent'];
 static List<bool> categoryStates = List.generate(2, (index) => false);
 static List<String> number =['200', '750'];//example values  pulled from db
 static List<String> properties=Property.properties;
 static List<bool> propertyStates = List.generate(Property.properties.length, (index) => false);
 static List<String> numberOfProperties =['20', '75','36','40','2'];//example values  pulled from db
static  bool searchButtonState =false;
 static double highestValue = 1000;
 static double lowestValue = 0;
 static  List <String> bedrooms=['Studio','1','2','3','4','5','6','7','7+'];
 static  List<String> bathrooms=['1','2','3','4','5','6','7','7+'];
 static List<String> popularFeatures=['Pet Friendly','Fire Alarm',' Laundry','Modern Kitchen','Pool','Gym','EmergencyExit'];
 static List<String> featuredAmenities=['Center Cooling','Storage','Heating','Sauna','Dish Washer','Balcony','Barbeque','Dryer','Elevator'];
static List<Unit> units=[ Unit( '3 BHK 800 Sq-Ft Flat',Random().nextInt(10), 'House', 'Sale', 100,
    Agent('Rajesh Koothrappali','assets/images/home/Unit/Agent/agent1/OIP (4).jpg','4446464646'), '131599041',
    '1.There two bed room with wide balcony. 2. Drawing room with fall ceiling & Texture Paint 3. Modern and modular kitchen with chimney and other attachments. 4. two bath room with tile work upto roof height and branded fittings. 5. Car parking and lift available. 6. Wall to wall pop , texture paint & tiles work on front elevation. 7. Vitrified tiles flooring, Kalinga wire, Branded electrical fittings. 8. Separate electric and water connections with appropriate supply.',
   'Delhi', 'Delhi/NCR', 'Sector 24','800 sqft',
 ['assets/images/home/Unit/unitImages/unit1/pexels-christa-grover-977018-2121121.jpg',
 'assets/images/home/Unit/unitImages/unit1/pexels-curtis-adams-1694007-24245748.jpg',
 'assets/images/home/Unit/unitImages/unit1/pexels-itsterrymag-2635038.jpg',
 'assets/images/home/Unit/unitImages/unit1/pexels-jvdm-1454805.jpg',
 'assets/images/home/Unit/unitImages/unit1/pexels-jvdm-1457847.jpg',
 'assets/images/home/Unit/unitImages/unit1/pexels-pixabay-280229.jpg',
 'assets/images/home/Unit/unitImages/unit1/pexels-vince-2227832.jpg'

 ],
Features({'Pet Friendly': false,
 'Fire Alarm':true,
 'Laundry' :true,
 'Modern Kitchen' :true,
 'Pool': true,
 'Gym':true,
 'Garage':true,
 "EmergencyExit" :true,
 "Center Cooling" :false,
 "Storage" :true,
 "Heating" :false,
 "Sauna" :false,
 "Dish Washer" :true,
 "Balcony" :true,
 "Barbeque" :true,
 "Dryer" :true,
 "Elevator" :true,
}, {
 'Baths':2,
 'Bedrooms':3

})
),Unit('2 BHK Builder Floor',Random().nextInt(10),'Villa', 'Sale', 24.1,
    Agent('Akash','assets/images/home/Unit/Agent/agent2/OI.jpeg','8596234569'), '629126491',
    '1.There two bed room with wide balcony. 2. Drawing room with fall ceiling & Texture Paint 3. Modern and modular kitchen with chimney and other attachments. 4. two bath room with tile work upto roof height and branded fittings. 5. Car parking and lift available. 6. Wall to wall pop , texture paint & tiles work on front elevation. 7. Vitrified tiles flooring, Kalinga wire, Branded electrical fittings. 8. Separate electric and water connections with appropriate supply.',
    'Patna', 'Bihar', 'Uttam Nagar','520 sqft',
   [
     'assets/images/home/Unit/unitImages/unit2/pexels-photo-262048.jpeg',
     'assets/images/home/Unit/unitImages/unit2/pexels-photo-1040893.jpeg',
     'assets/images/home/Unit/unitImages/unit2/pexels-photo-1918291.jpeg',
     'assets/images/home/Unit/unitImages/unit2/pexels-photo-6970048.jpeg',
     'assets/images/home/Unit/unitImages/unit2/pexels-pixabay-208736.jpg',
     'assets/images/home/Unit/unitImages/unit2/pexels-pixabay-276724.jpg'

   ],
    Features({'Pet Friendly': false,
     'Fire Alarm':false,
     'Laundry' :true,
     'Modern Kitchen' :true,
     'Pool': true,
     'Gym':true,
     'Garage':true,
     "EmergencyExit" :true,
     "Center Cooling" :true,
     "Storage" :true,
     "Heating" :false,
     "Sauna" :false,
     "Dish Washer" :true,
     "Balcony" :false,
     "Barbeque" :false,
     "Dryer" :true,
     "Elevator" :true,
    }, {
     'Baths':3,
     'Bedrooms':8

    })
), ];
}


class Agent {
 late String name;
 late String imagepath;
 late String phonenumber;
 Agent(this.name,this.imagepath,this.phonenumber);
}

class Features {
  late Map<String , bool> features ;
  late Map<String , int> amenities;
  Features(this.features,this.amenities);
}


//unit is one specific item i.e a house/land/apartment
class Unit {
 //todo: add date of listing
  late int listingDate;
  late String shortDescription;
  late String propertytype; //apartment/land
 late String propertystatus;//rent / sale
 late double propertyprice;
 late Agent propertyagent;
 late String propertyId;
 late String propertyInfo;
 late String propertyCity;
 late String propertyState;
 late String propertyAddress;
 late String propertySize;
 late List<String> propertyImages;
 late Features feature ;
 Unit(  this.shortDescription,  this.listingDate ,this.propertytype ,this.propertystatus, this.propertyprice ,
     this.propertyagent, this.propertyId,this.propertyInfo,this.propertyCity,this.propertyState,
     this.propertyAddress,this.propertySize,this.propertyImages,this.feature
     );
}