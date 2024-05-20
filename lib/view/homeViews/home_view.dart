import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                           },
                           child: Container(
                            decoration:BoxDecoration(
                              color: dataProviderModel.states[index] ? AppColor.secondary.withOpacity(0.4):AppColor.white,
                              border: Border.all(
                                color: AppColor.black, // Border color
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