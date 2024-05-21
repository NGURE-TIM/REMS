import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:visanka/theme/color.dart';
import 'package:visanka/viewModel/home_view_model.dart';

const khintstyle=TextStyle(
    color: AppColor.grey
);
class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  State<Dash> createState() => _DashState();
}

class _DashState extends State<Dash> {
  DashBoardviewModel _boardviewModel =DashBoardviewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:   AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset("assets/images/splash/REMlogo.png"),
          ),
          actions: [
            Row(
              children: [
                Icon(Icons.search),
                Padding(
                  padding: const EdgeInsets.only(left:20,right: 20),
                  child:  Text(
                    'Log In',
                    style:Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: AppColor.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0 ,right: 20),
            child: Column(
              children: [
                Container(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:List.generate(5, (index) =>   Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Consumer<DashBoardviewModel>( builder:(context,dataProviderModel,child){
                        return
                         GestureDetector(
                           onTap: (){
                             Provider.of<DashBoardviewModel>(context , listen: false).changeState(index);
                             showModalBottomSheet(
                                 isScrollControlled: true,
                                 transitionAnimationController: AnimationController(
                                   vsync: Navigator.of(context),
                                   duration: const Duration(milliseconds: 900), // Adjust animation duration as needed
                                   reverseDuration: const Duration(milliseconds: 900),
                                 ),
                                 context: context, builder: (context){
                               return Container(
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(20)
                                 ),
                                 width: double.infinity,
                                 height: 300,
                                 child:  Padding(
                                   padding: const EdgeInsets.all(20.0),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       const Padding(
                                         padding: EdgeInsets.only(bottom: 10.0),
                                         child: Center(
                                           child: SizedBox(
                                             width: 50,
                                             child: Divider(

                                               thickness:4,
                                               color: AppColor.grey,
                                             ),
                                           ),
                                         ),
                                       ),
                                       Text(
                                         'Category',
                                             style: Theme.of(context).textTheme.displayMedium,
                                       ),
                                       const Padding(
                                         padding: EdgeInsets.only(top:5,bottom: 20),
                                         child: Divider(
                                           thickness:1,
                                           color: AppColor.grey,

                                         ),
                                       ),

                                 Center(
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: List.generate(2, (index) =>
                                         Consumer(
                                           child: InkWell(
                                             highlightColor: null,
                                             splashColor: AppColor.secondary.withOpacity(0.4) ,
                                             radius: 20,
                                             borderRadius: BorderRadius.circular(12),
                                             onTap: (){},
                                             child: Container(
                                                 width: 100,
                                                 height: 40,
                                                 decoration: BoxDecoration(
                                                   color:AppColor.secondary.withOpacity(0.4),
                                                   //dataProviderModel.buttonStates[index]?AppColor.primary:Colors.transparent,
                                                   borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
                                                   border: Border.all(
                                                     width: 1,
                                                     color: AppColor.secondary, // Define border color
                                                   ),
                                                 ),
                                                 child: Center(
                                                   child: Text(
                                                     'Rent',
                                                     style: Theme.of(context).textTheme.displayMedium,
                                                     //dataProviderModel.buttonStates[index] ? Theme.of(context).textTheme.bodyLarge:Theme.of(context).textTheme.bodyMedium,
                                                   ),
                                                 )
                                             ),
                                           );
    }
                                         )
                                 ),
                                 ),
                                 ),
                                       const Padding(
                                         padding: EdgeInsets.only(top:20,bottom:20),
                                         child: Divider(
                                           thickness:1,
                                           color: AppColor.grey,

                                         ),
                                       ),
                                 ElevatedButton(onPressed:(){
//todo:Only show the filtered properties
                                 },
                                   style:

                                   ElevatedButton.styleFrom(
                                     fixedSize: Size(300, 45),
                                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                     elevation: 5, backgroundColor:   AppColor.secondary,
                                   ), child: Text(
                                     'Show all 1700 Properties',
                                     style: TextStyle(
                                         fontSize: 18,
                                         fontWeight: FontWeight.w400,
                                         color: AppColor.white
                                     ),

                                   ),
                                 ),
                                     ],
                                   ),
                                 ),
                               );
                             }


                             );
                           },
                           child: Container(
                            decoration:BoxDecoration(
                              color: dataProviderModel.states[index] ? AppColor.secondary.withOpacity(0.4):AppColor.white,
                              border: Border.all(
                                color: AppColor.grey, // Border color
                                width: 1.0, // Border width
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    _boardviewModel.items[index],
                                    style:Theme.of(context).textTheme.displayMedium,
                                  ),
                                ),
                                IconButton(onPressed: (){
                                  Provider.of<DashBoardviewModel>(context , listen: false).changeState(index);

                                }, icon:Icon(Icons.arrow_drop_down) )
                              ],
                            ),
                                                   ),
                         );
  }
                      ),
                    ),)
                  ),
                ),

              ],
            ),
          ),

        ),


      ),
    );
  }
}