
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:provider/provider.dart';
import '../../theme/color.dart';
import '../../viewModel/home_view_model.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//this view makes use of the home model
class Unit extends StatefulWidget {
  late int index;
  Unit(this.index);
  static const id = '/unit';
  @override
  State<Unit> createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  DashBoardviewModel _boardviewModel =DashBoardviewModel();


  @override
  Widget build(BuildContext context) {
   // List<String> featureKeys = _boardviewModel.unit[widget.index].feature.features.keys.toList();
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.primary,
        ),
        SafeArea(child: Scaffold(

            body:Stack(
              children:[CustomScrollView(
                slivers: [
                  SliverAppBar(
                    snap: true,
                    floating: true,
                    expandedHeight: 20,
                    flexibleSpace:
                    GlassContainer.clearGlass(

                      elevation:5,
                      child:Padding(
                        padding: const EdgeInsets.all(12),
                        child:  Row(
                          children: [
                            Spacer(),
                            Icon( MdiIcons.heartOutline),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(Icons.share),

                          ],
                        ),
                      )  ,

                      gradient: LinearGradient(
                        colors: [
                          AppColor.primary.withOpacity(0.05),
                          AppColor.primary.withOpacity(0.1),
                          AppColor.primary.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderGradient: LinearGradient(
                        colors: [

                          AppColor.primary.withOpacity(0.05),
                          AppColor.primary.withOpacity(0.20),
                          AppColor.primary.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      blur: 20,
                      borderRadius: BorderRadius.circular(0),
                      borderWidth: 2.0,

                      shadowColor: AppColor.primary.withOpacity(0.20),
                    ),
                  ),
                  SliverAppBar(
                  leading:Icon(Icons.add,color: Colors.transparent,),
                    stretch: true,
                    //todo:implement onstretch trigger to refresh screen

                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
collapseMode: CollapseMode.parallax,
                      background: FlutterCarousel(
                        options: CarouselOptions(

                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 10),
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          showIndicator: true,
                          slideIndicator: const CircularSlideIndicator(
                              indicatorBorderColor: AppColor.white,
                              currentIndicatorColor: AppColor.primary,
                              indicatorBackgroundColor:AppColor.grey
                          ),
                          floatingIndicator: true,
                          enableInfiniteScroll: true,
                        ),
                        items: _boardviewModel.unit[widget.index].propertyImages.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Image(
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  image: AssetImage(item));
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                          childCount: 1,
                              (BuildContext context, int index){
                            return Column(

                              children: [

                                Material(
                                  shadowColor: AppColor.black.withOpacity(0.6),
                                  elevation:5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    width: double.infinity,

                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(

                                        crossAxisAlignment:CrossAxisAlignment.start ,
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.only(top: 0,bottom: 5),
                                            child: Text(
                                                '${_boardviewModel.unit[widget.index].propertyprice} Lacs' ,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: AppColor.black,
                                                    fontWeight: FontWeight.w600
                                                )),
                                          ),

                                          Center(
                                            child:
                                            Text(
                                                '${_boardviewModel.unit[widget.index].shortDescription} ' ,
                                                style: Theme.of(context).textTheme.displayLarge
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(bottom:5.0,),
                                            child: Row(
                                              children: [
                                                Icon(Icons.location_city),
                                                SizedBox(width: 5,),
                                                Text(_boardviewModel.unit[widget.index].propertyCity,style:TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:FontWeight.w900,
                                                    color: AppColor.black.withOpacity(0.8)
                                                ) ),
                                              ],
                                            ),
                                          ),

                                          Row(
                                            children: [

                                              Column(
                                                crossAxisAlignment:CrossAxisAlignment.start ,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom:5.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.flag),
                                                        SizedBox(width: 5,),
                                                        Text(_boardviewModel.unit[widget.index].propertyState,
                                                          style:TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:FontWeight.w900,
                                                              color: AppColor.black.withOpacity(0.8)
                                                          ) ,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom:5.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.location_on_outlined),
                                                        SizedBox(width: 5,),
                                                        Text(_boardviewModel.unit[widget.index].propertyAddress,style:TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:FontWeight.w900,
                                                            color: AppColor.black.withOpacity(0.8)
                                                        ) )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                              GestureDetector(
                                                onTap: () async {
                                                  //navigate to map of the location only if logged in
                                                },
                                                child: Container(
                                                  width: 140,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color:   AppColor.primary,
                                                    borderRadius: BorderRadius.circular(12), // Adjust border radius as needed

                                                  ),
                                                  child: Center(

                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(Icons.directions),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                            'Directions',
                                                            style: Theme.of(context).textTheme.displayMedium
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )





                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Material(
                                  shadowColor: AppColor.black.withOpacity(0.6),
                                  elevation:5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    width: double.infinity,

                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(

                                        crossAxisAlignment:CrossAxisAlignment.start ,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0,bottom: 10),
                                            child: Text(
                                                'Overview ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: AppColor.black,
                                                    fontWeight: FontWeight.w600
                                                )),
                                          ),
                                          Row(
                                            children: [

                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Bedrooms'),
                                                  Row(
                                                    children: [

                                                      Icon(Icons.bedroom_parent_outlined),
                                                      SizedBox(width: 5,),
                                                      Text(_boardviewModel.unit[index].feature.amenities['Bedrooms'] . toString()),
                                                    ],
                                                  )

                                                ],
                                              ),
                                              SizedBox(width: 10,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Bathrooms'),
                                                  Row(
                                                    children: [

                                                      Icon(Icons.bathtub_outlined),
                                                      SizedBox(width: 5,),
                                                      Text(_boardviewModel.unit[index].feature.amenities['Baths'] . toString()),
                                                    ],
                                                  )

                                                ],
                                              ),
                                              SizedBox(width: 10,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Size'),
                                                  Row(
                                                    children: [

                                                      Icon(MdiIcons.tapeMeasure),
                                                      SizedBox(width: 5,),
                                                      Text(_boardviewModel.unit[index].propertySize)
                                                    ],
                                                  )

                                                ],
                                              ),
                                              SizedBox(width: 10,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text('Floors'),
                                                  Row(
                                                    children: [

                                                      Icon(MdiIcons.floorPlan),
                                                      SizedBox(width: 5,),
                                                      Text('${'4'} '),
                                                    ],
                                                  )

                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height:  10,),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0,bottom: 10),
                                            child: Text(
                                                'Description' ,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: AppColor.black,
                                                    fontWeight: FontWeight.w600
                                                )),
                                          ),

                                          Row(
                                            crossAxisAlignment:CrossAxisAlignment.start ,
                                            children: [
                                              Consumer<DashBoardviewModel>( builder:(context,dataProviderModel,child){
                                                return Icon(MdiIcons.arrowDecisionAuto,color:AppColor.secondary,);
                                              }),

                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(bottom:5.0,),
                                                    child: Container(
                                                      width:300,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: AppColor.primary.withOpacity(0.6), // Border color
                                                          width: 1.0,         // Border width
                                                        ),
                                                        borderRadius: BorderRadius.circular(12.0),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(10.0),
                                                        child: ExpandableText (


                                                          _boardviewModel.unit[widget.index].propertyInfo,
                                                          expandText: 'Read more',
                                                          animationDuration: Duration(seconds: 1),
                                                          animationCurve: Curves.decelerate,
                                                          textAlign: TextAlign.left,
                                                          collapseText: 'Show less',
                                                          maxLines: 4,
                                                          linkColor:AppColor.secondary,
                                                          collapseOnTextTap: true,
                                                          animation: true,
                                                          style:TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:FontWeight.w100,
                                                              color: AppColor.black.withOpacity(0.8)
                                                          ) ,
                                                          linkStyle:TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:FontWeight.bold,

                                                          )  ,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),



                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Material(
                                  shadowColor: AppColor.black.withOpacity(0.6),
                                  elevation:5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    width: double.infinity,

                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(

                                        crossAxisAlignment:CrossAxisAlignment.start ,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0,bottom: 10),
                                            child: Text(
                                                'Features' ,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: AppColor.black,
                                                    fontWeight: FontWeight.w600
                                                )),
                                          ),

                                          buildFeatureWidget(widget.index,_boardviewModel),



                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Material(
                                  shadowColor: AppColor.black.withOpacity(0.6),
                                  elevation:5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    width: double.infinity,

                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(

                                        crossAxisAlignment:CrossAxisAlignment.start ,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 0,bottom: 10),
                                            child: Text(
                                                'Agent' ,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: AppColor.black,
                                                    fontWeight: FontWeight.w600
                                                )),
                                          ),
                                          Row(
                                            crossAxisAlignment:CrossAxisAlignment.center,
                                            children: [

                                              Stack(
                                                  children :[
                                                    Container(
                                                      height:100 ,
                                                      width:150,
                                                    ),
                                                    ClipOval(
                                                      child: Container(
                                                        height:90,
                                                        width: 90,
                                                        child: Image.asset(
                                                          _boardviewModel.unit[widget.index].propertyagent.imagepath,  // Your image asset path
                                                          fit: BoxFit.cover,  // Adjust as per your requirement
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 80,
                                                      left: 40,
                                                      child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(12.0),
                                                              border: Border.all(
                                                                color: AppColor.white, // Border color
                                                                width: .5, // Border width
                                                              ),
                                                              color: AppColor.error
                                                          ),


                                                          child: Padding(
                                                            padding: const EdgeInsets.all(2.0),
                                                            child: Row(

                                                              children: [
                                                                Icon(MdiIcons.shieldAccountVariant,size: 15, color: AppColor.white,),
                                                                Text('VERIFIED AGENT', style:TextStyle(fontSize: 10, color: AppColor.white),),
                                                              ],
                                                            ),
                                                          )
                                                      ),
                                                    )
                                                  ]

                                              ),
                                              Column(
                                                mainAxisAlignment:MainAxisAlignment.start,
                                                crossAxisAlignment:CrossAxisAlignment.start,
                                                children: [
                                                  buildRichText('Agent name: ', '${_boardviewModel.unit[widget.index].propertyagent.name}' ),
                                                  buildRichText('Reviews: ', 'No reviews' ),
                                                  buildRichText('Time on REM: ', '2 weeks' ),
                                                  buildRichText('Average Response time: ', '1 hour' ),

                                                ],
                                              )
                                            ],
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(

                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColor.grey,
                                                    //AppColor.primary.withOpacity(0.6)
                                                    width: 1.0,         // Border width
                                                  ),
                                                  borderRadius: BorderRadius.circular(12.0),
                                                ),
                                                child:Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    crossAxisAlignment:CrossAxisAlignment.start ,
                                                    children: [
                                                      Text('Request Call Back',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: AppColor.black,
                                                            fontWeight: FontWeight.w900
                                                        )

                                                        ,),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text('Unable to reach the agent? Simply request a call back to alert them to contact you. ',
                                                          style:
                                                          TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:FontWeight.w100,
                                                              color: AppColor.black.withOpacity(0.8)
                                                          )
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width:double.infinity,
                                                        decoration: BoxDecoration(

                                                          border: Border.all(
                                                            color: AppColor.primary,
                                                            width: 2.0,         // Border width
                                                          ),
                                                          borderRadius: BorderRadius.circular(0),
                                                        ),
                                                        child:Padding(
                                                          padding: const EdgeInsets.all(10.0),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 20,right: 20),
                                                            child: Center(
                                                              child: Text('Request a Call Back',
                                                                style: TextStyle(
                                                                    fontSize: 15,
                                                                    color:AppColor.secondary,
                                                                    fontWeight: FontWeight.w600
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                )
                                            ),
                                          ),




                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),

                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            );
                          }
                      )



                  )
                ],
              ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.white.withOpacity(0.85),
                        border: Border.all(
                          color: AppColor.black, // Border color
                          width: 1.0,         // Border width
                        ),
                        borderRadius: BorderRadius.circular(0),
                      ),

                    height: 60.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildGestureDetector(context,'Call',(){},Icons.call),
                        SizedBox(width: 5,),
                        buildGestureDetector(context,'Email',(){},Icons.email),
                        SizedBox(width: 5,),
                        buildGestureDetector(context,'Whatsapp',(){},MdiIcons.whatsapp),


                      ],
                    )
                  ),
                ),

              ]




            ),
        ))
      ],
    );
  }

  GestureDetector buildGestureDetector(BuildContext context, String buttonName , Function () onPressed, IconData icd) {
    return GestureDetector(
                        onTap: onPressed,
                        child: Container(

                          height: 40,
                          decoration: BoxDecoration(
                            color:   AppColor.primary,
                            borderRadius: BorderRadius.circular(12), // Adjust border radius as needed

                          ),
                          child: Center(

                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(icd),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      buttonName,
                                      style: Theme.of(context).textTheme.displayMedium
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
  }

  RichText buildRichText(String key , String value) {
    return RichText(
              text: TextSpan(
              text: key,
                  style:TextStyle(
                      fontSize: 12,
                      fontWeight:FontWeight.w300,
                      color: AppColor.black.withOpacity(01)
                  ),
                children: <TextSpan>[
                  TextSpan(
                    text: value,
                    style:TextStyle(
                  fontSize: 12,
                  fontWeight:FontWeight.w900,
                  color: AppColor.secondary
              )
                  ),

                ],
              ),
    );
  }
}
Widget buildFeatureWidget(int index, DashBoardviewModel _boardviewModel) {
  return Row(
    crossAxisAlignment:CrossAxisAlignment.start ,
    children: [
      Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
      ..._boardviewModel.unit[index].feature.features.entries.toList().sublist(0, 9).map((entry) {

        bool value = entry.value;
        String key = entry.key;
        return Row(
          children: [
        Icon(value ? Icons.check : Icons.close , color: value ? Colors.green : AppColor.error),
        Padding(
          padding: const EdgeInsets.only(left :5.0),
          child: Text(
            '$key',
            style: TextStyle(fontSize: 16),
          ),
        )
          ],
        );
      }).toList(),

        ]
      ),
      SizedBox(
        width: 20,
      ),
      Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
      ..._boardviewModel.unit[index].feature.features.entries.toList().sublist(9, 17).map((entry) {

        bool value = entry.value;
        String key = entry.key;
        return Row(
          children: [
        Icon(value ? Icons.check : Icons.close , color: value ? Colors.green : AppColor.error),
        Padding(
          padding: const EdgeInsets.only(left :5.0),
          child: Text(
            '$key',
            style: TextStyle(fontSize: 16),
          ),
        )
          ],
        );
      }).toList(),

        ]
      ),
    ],
  );
}
