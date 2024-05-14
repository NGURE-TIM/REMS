
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visanka/theme/color.dart';
import 'package:dropdown_search/dropdown_search.dart';
bool press =false;
String city='';
const khintstyle=TextStyle(
    color: AppColor.grey
);
List<String> cities =['Patna',
  'Delhi','Aligarh','Varanasi' ,'Queens'
];
String selectedItem ='';

class City extends StatefulWidget {
  static const id = '/city';
  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.primary,
        ),
        SafeArea(child: Scaffold(
          appBar:  AppBar(
              leading: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon:Icon(Icons.arrow_back),),

              actions: [Padding(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                    onTap: (){},
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color:AppColor.secondary,
                        fontSize: 20, // Adjust the font size as needed
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    )
                ),
              )]),

          body: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                const SizedBox(
                  height: 90,
                ),
                Center(
                  child: Text('What is your ideal city?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                DropdownSearch<String>(
                  onChanged: (value){
                    city=value!;
                    setState(() {
                      if(city!=''){
                        press=true;
                      }
                    });
                  },
                  popupProps:  PopupProps.menu(
                    showSelectedItems: true,
                    searchFieldProps :  TextFieldProps(
                        style:Theme.of(context).textTheme.bodyMedium,
                        keyboardType: TextInputType.text,
                        showCursor: true,
                        controller: null,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: AppColor.primary,
                          hintText: "Search here ....",
                          hintStyle: khintstyle,
                        )
                    ),
                    itemBuilder:(BuildContext context, String item,bool isSelected,){
                      return
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration:BoxDecoration(
                            color: isSelected ? AppColor.primary : Colors.white,
                            border: const Border(
                              top: BorderSide(
                                color: AppColor.black, // Set the color of the top border
                                width: 0.05, // Set the width of the top border
                              ),
                              bottom: BorderSide(
                                  color: AppColor.black, // Set the color of the bottom border
                                  width: 0.05 // Set the width of the bottom border
                              ),
                            ),
                          ),

                          padding: EdgeInsets.all(10),
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.bodyMedium,

                          ),
                        );
                    },
                    scrollbarProps: ScrollbarProps(
                        shape: RoundedRectangleBorder(
                          borderRadius:BorderRadius.circular(10),
                        ),
                        thumbColor:AppColor.grey
                    ),
                    constraints: BoxConstraints(
                        maxHeight:400
                    ),

                    showSearchBox: true,
                    menuProps: MenuProps(
                        elevation: 6,
                        shadowColor:  AppColor.primary
                    ),
                  ),
                  items: cities,
                  dropdownDecoratorProps:  DropDownDecoratorProps(
                    baseStyle:Theme.of(context).textTheme.bodyMedium,
                    dropdownSearchDecoration: const InputDecoration(
                      hintText: "Select city",
                      hintStyle: khintstyle,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:AppColor.secondary),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
                Center(
                  child: ElevatedButton(onPressed:(){

                  },
                    style:

                    ElevatedButton.styleFrom(
                      fixedSize: Size(200, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      elevation: 5, backgroundColor: press?AppColor.primary:Colors.white,
                    ), child: Text(
                      'Next',
                      style:press ? Theme.of(context).textTheme.bodyLarge:Theme.of(context).textTheme.bodyMedium,

                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
