import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:visanka/theme/color.dart';
import 'package:visanka/viewModel/home_view_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                             showBottom(context,index);
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
                                  showBottom(context,index);

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



showBottom(BuildContext context ,int index){
  return showModalBottomSheet(
      isScrollControlled: true,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 900), // Adjust animation duration as needed
        reverseDuration: const Duration(milliseconds: 900),
      ),
      context: context, builder: (context){
    return Consumer
    <DashBoardviewModel>( builder:(context,dataProviderModel,child)
      {
        return
      Container(
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
      dataProviderModel.items[index],
      style: Theme.of(context).textTheme.displayMedium,
      ),
      const Padding(
      padding: EdgeInsets.only(top:5,bottom: 20),
      child: Divider(
      thickness:1,
      color: AppColor.grey,

      ),
      ),
        dataProviderModel.items[index]==1 ?
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:


              List.generate(2, (index) =>
                  Consumer<DashBoardviewModel>(
                    builder: (context, dataProviderModel, child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: InkWell(
                          highlightColor: null,
                          splashColor: AppColor.secondary.withOpacity(0.4),
                          radius: 20,
                          borderRadius: BorderRadius.circular(12),
                          onTap: () async {
                            showProgress(context);
                            await Future.delayed(Duration(seconds: 2));
                            Navigator.of(context).pop();
                            dataProviderModel.category(index);


                          },
                          child: Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color:   dataProviderModel.categoriesStates[index] ? AppColor.secondary.withOpacity(.3): Colors.transparent,
                              borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
                              border: Border.all(
                                width: 1,
                                color: AppColor.secondary, // Define border color
                              ),
                            ),
                            child: Center(
                              child: Text(
                                dataProviderModel.categories[index],
                                style: dataProviderModel.categoriesStates[index] ? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ),
            ),
          )
      :
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:


            List.generate (5, (index) =>
                Consumer<DashBoardviewModel>(
                  builder: (context, dataProviderModel, child) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: InkWell(
                        highlightColor: null,
                        splashColor: AppColor.secondary.withOpacity(0.4),
                        radius: 20,
                        borderRadius: BorderRadius.circular(12),
                        onTap: () async {
                          showProgress(context);
                          await Future.delayed(Duration(seconds: 2));
                          Navigator.of(context).pop();
                          dataProviderModel.toggleProperty(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:   dataProviderModel. propertyStates[index] ? AppColor.secondary.withOpacity(.3): Colors.transparent,
                            borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
                            border: Border.all(
                              width: 1,
                              color: AppColor.secondary, // Define border color
                            ),
                          ),
                          child: Center(
                            child: Text(
                              dataProviderModel.propertyTypes[index],
                              style: dataProviderModel. propertyStates[index] ? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
      Consumer<DashBoardviewModel>(
      builder: (context, dataProviderModel, child)
      {
      return
      ElevatedButton(onPressed:(){
//todo:Only show the filtered properties
      Navigator.of(context).pop();
      },
      style:

      ElevatedButton.styleFrom(
      fixedSize: Size(300, 45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5, backgroundColor:   AppColor.secondary,
      ), child: Text(
      'Show all ${dataProviderModel.numberProperties} Properties',
      style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: AppColor.white
      ),

      ),
      );
      }
      ),

      ],
      ),
      ),
      );
      }

    );
  }


  );



}

showProgress(BuildContext context){
  return showDialog(
      context: context,
      builder: (BuildContext context) {

        return Stack(
            children: [
              ModalBarrier(
                color: AppColor.black.withOpacity(.2),
              ),
              const AlertDialog(
                elevation: 0,
                shadowColor: null,
                backgroundColor: Colors.transparent,
                content:SpinKitChasingDots(color: AppColor.primary,size: 60,
                  duration: Duration(seconds: 2),
                ),



              ),
            ]
        );

      });
}