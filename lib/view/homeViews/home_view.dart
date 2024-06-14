import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:visanka/theme/color.dart';
import 'package:visanka/view/homeViews/unit_view.dart';
import 'package:visanka/viewModel/home_view_model.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:animated_icon/animated_icon.dart';
//import 'package:syncfusion_flutter_sliders/sliders.dart';
const khintstyle=TextStyle(
    color: AppColor.grey
);
DashBoardviewModel _boardviewModel =DashBoardviewModel();
class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);
  @override
  State<Dash> createState() => _DashState();
}
class _DashState extends State<Dash> {
  
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0 ,right: 20),
              child: Container(
                height: 40,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:List.generate(_boardviewModel.items.length, (index) =>   Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Consumer<DashBoardviewModel>( builder:(context,dataProviderModel,child){
                        return GestureDetector(
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Divider(
                color: AppColor.primary.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0 ,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${_boardviewModel.listing} properties found.',style:TextStyle(color:AppColor.black)),
                      Container(
                          color: AppColor.primary,
                          child: Text('${_boardviewModel.newListing} new.', style:TextStyle(color:AppColor.black) )),

                    ],
                  ),
                  Spacer(),
                  Container(
                    decoration:BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: AppColor.grey, // Border color
                        width: 1.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [

                          GestureDetector(

                            onTapDown: (details){
                              _showPopupMenu(context,details.globalPosition);
                            },

                            child: Container(height:30,width: 30 , child: Image.asset('assets/images/home/sort.png')),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                                'Sort',
                                style:TextStyle(color:AppColor.black)
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),

            Expanded(
              child: CustomScrollView(
                    slivers: [
                      SliverList(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0 , right: 20 , top: 20),
                      child: Card(
                          shadowColor: AppColor.primary,
                          elevation:4,
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                            onTap:(){

                              Navigator.push(context, MaterialPageRoute(builder: (context) => Unit(index)));

                            },
                                child: Stack(children: [
                                  FlutterCarousel(
                                    options: CarouselOptions(
                                      height: 200,
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
                                    items: _boardviewModel.unit[index].propertyImages.map((item) {
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
                                
                                  Positioned(
                                    top: 150,
                                    left: 10,
                                    child: ClipOval(
                                      child: Container(
                                        height:40,
                                        width: 40,
                                        child: Image.asset(
                                          _boardviewModel.unit[index].propertyagent.imagepath,  // Your image asset path
                                          fit: BoxFit.cover,  // Adjust as per your requirement
                                        ),
                                      ),
                                    ),
                                  ),
                                                      Consumer<DashBoardviewModel>( builder: (context, model, child){
                                                        return Positioned(
                                                          bottom: 150,
                                                          right: 10,
                                                          child: ClipOval(
                                                            child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColor.black.withOpacity(0.4)
                                  ),
                                  height:40,
                                  width: 40,
                                  child: IconButton(
                                
                                    onPressed: () {
                                      Provider.of<DashBoardviewModel>(context , listen: false).changefavourite(index);
                                    },
                                    icon: Icon(
                                      model.favourite[index]?   MdiIcons.heart:MdiIcons.heartOutline,
                                
                                      color:  model.favourite[index] ? AppColor.error:AppColor.white,
                                    ),
                                  )
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                
                                  Positioned(
                                    bottom: 170,
                                    left: 10,
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
                                  ),
                                ],),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Text(_boardviewModel.unit[index].propertytype),
                                    Spacer(),
                                    Text('Listed 1 day ago')
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom:5.0, left: 10,right: 10),
                                child: Text('${_boardviewModel.unit[index].propertyprice} Lacs'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom:5.0, left: 10,right: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_city),
                                    SizedBox(width: 5,),
                                    Text(_boardviewModel.unit[index].propertyCity),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.flag),
                                    SizedBox(width: 5,),
                                    Text(_boardviewModel.unit[index].propertyState)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom:5.0, left: 10,right: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined),
                                    SizedBox(width: 5,),
                                    Text(_boardviewModel.unit[index].propertyAddress)
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom:5.0, left: 10,right: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.bedroom_parent_outlined),
                                    SizedBox(width: 5,),
                                    Text(_boardviewModel.unit[index].feature.amenities['Bedrooms'] . toString()),
                                    SizedBox(width: 10,),
                                    Icon(Icons.bathtub_outlined),
                                    SizedBox(width: 5,),
                                    Text(_boardviewModel.unit[index].feature.amenities['Baths'] . toString()),
                                    SizedBox(width: 10,),
                                    Icon(MdiIcons.tapeMeasure),
                                    SizedBox(width: 5,),
                                    Text(_boardviewModel.unit[index].propertySize)
                                  ],
                                ),
                              ),
              
                              Padding(
                                  padding: const EdgeInsets.only(bottom:10.0,),
                                  child: Divider(
                                    height: 1,
                                    thickness: .5,
                                    color: AppColor.black,
                                  )
                              ),
              
                              Padding(
                                padding: const EdgeInsets.only(bottom:10.0,),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        //todo : call agent
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
                                              Icon(Icons.call),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                  'Call',
                                                  style: Theme.of(context).textTheme.displayMedium
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        //todo : call agent
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
              
                                              Icon(MdiIcons.whatsapp),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Whatsapp',
                                                style:Theme.of(context).textTheme.displayMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                      ),
                    );
                  },
                  childCount: _boardviewModel.unit.length
              ),
                    ),
                    ],
                  ),
            ),
          ],
        ),

    ),
    );
  }
}


void _showPopupMenu(BuildContext context, Offset position) async {

  await showMenu(
    elevation: 3,
    shadowColor: AppColor.primary.withOpacity(.08),
    color: AppColor.white,

    context: context,
    position:  RelativeRect.fromLTRB(position.dx, position.dy+10, position.dx, 0),
    items: _boardviewModel.sortItems.map((item) {

      return PopupMenuItem<String>(

        onTap:(){

            Provider.of<DashBoardviewModel>(context, listen: false).selectedItem(item);
        },
        value: item,
        child:
          Consumer<DashBoardviewModel>( builder: (context, model, child){
print(model.selectedSort);
          return
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                item,
                style: TextStyle(
                  color: model.selectedSort== item ? AppColor.black:AppColor.secondary ,
                  fontWeight: model.selectedSort == item ? FontWeight.w900 : FontWeight.w700,
                ),
              ),
              model.selectedSort== item ? Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Icon(Icons.check),
              ) : SizedBox.shrink(),
            ],
          ),
        );}),
      );

    }).toList(),
  );
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
      child:  Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
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
        padding: EdgeInsets.only(top:5),
        child: Divider(
        thickness:1,
        color: AppColor.grey,
        
        ),
        ),
          if (dataProviderModel.items[index]==dataProviderModel.items[0]) Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                List.generate(dataProviderModel.categories.length, (index) =>
                    Consumer<DashBoardviewModel>(
                      builder: (context, dataProviderModel, child) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () async {
                              dataProviderModel.showButtonLoading();
                              dataProviderModel.togglePreference(index);

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
          else if(dataProviderModel.items[index]==dataProviderModel.items[1]) Center(
            child: Wrap(
              verticalDirection: VerticalDirection.down,
              spacing: 5,
              children:


              List.generate (dataProviderModel.propertyTypes.length, (index) =>
                  Consumer<DashBoardviewModel>(
                    builder: (context, dataProviderModel, child) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5,bottom: 10),
                        child: GestureDetector(
                          onTap: () async {
                            dataProviderModel.showButtonLoading();
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
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
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
          )
        else if(dataProviderModel.items[index]==dataProviderModel.items[2]) Center(
              child:   Padding(
                padding: const EdgeInsets.only(top: 30 ,bottom: 10),
                child: Column(
                  children: [
                    FlutterSlider(
                      rangeSlider: true,
                        values:  [dataProviderModel.lowestValue,dataProviderModel.highestValue],
                        step: FlutterSliderStep(step: 100),

                        handler: FlutterSliderHandler(
                    child: Icon(
                          Icons.chevron_right,
                          color: AppColor.primary,
                          size: 24,
                          ),
                          opacity: 1,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.secondary.withOpacity(.3),
                                  blurRadius: 4,
                                  spreadRadius: .05,
                                  offset: Offset(0, 4)
                              ),
                            ],
                          ),
                        ),
                        rightHandler: FlutterSliderHandler(
                          child: Icon(
                            Icons.chevron_left,
                            color: AppColor.primary,
                            size: 24,
                          ),
                          opacity: 1,
                          decoration:  BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColor.secondary.withOpacity(.3),
                                  blurRadius: 4,
                                  spreadRadius: .05,
                                  offset: Offset(0, 4)
                              ),
                            ],
                          ),
                        ),
                        tooltip: FlutterSliderTooltip(

                            textStyle:  const TextStyle(
                              fontSize: 25,
                              color: AppColor.black,
                            ),
                            boxStyle: FlutterSliderTooltipBox(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: AppColor.primary.withOpacity(.3),
                                )
                            ),
                          leftPrefix: const ImageIcon(
                            AssetImage('assets/images/home/rupee.png'),
                            size: 50.0,
                          ),
                          rightPrefix: const ImageIcon(
                            AssetImage('assets/images/home/rupee.png'),
                            size: 50.0,
                          ),
                        ),
                        trackBar: FlutterSliderTrackBar(
                          inactiveTrackBarHeight: 5,
                          activeTrackBarHeight: 6,
                          inactiveTrackBar: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                              color:Colors.black12,
                              border: Border.all(width: 10, color: AppColor.secondary)
                          ),
                          activeTrackBar: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColor.secondary.withOpacity(.5)
                          ),
                        ),
                        max: 1000,
                        min: 0,
                        onDragging: (handerIndex,lowerValue ,upperLimit){
                    dataProviderModel.updatePrice( lowerValue, upperLimit);
                    dataProviderModel.showButtonLoading();
                        }
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                    ('Minimum price(Lac)'),
                                    style:  Theme.of(context).textTheme.titleSmall
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color:  Colors.transparent,
                                    borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.secondary, // Define border color
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                        ('${dataProviderModel.lowestValue.toInt().toString()} '),


                                        style:  Theme.of(context).textTheme.displayMedium
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 9,
                            color: AppColor.secondary
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                    ('Maximum price(Lac)'),
                                    style:  Theme.of(context).textTheme.titleSmall
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color:  Colors.transparent,
                                    borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
                                    border: Border.all(
                                      width: 1,
                                      color: AppColor.secondary, // Define border color
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      ('${dataProviderModel.highestValue.toInt().toString()}'),
                                      style:  Theme.of(context).textTheme.displayMedium
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )






                  ],
                ),
              ),

            )
            else if(dataProviderModel.items[index]==dataProviderModel.items[3]) Center(
      child:   Padding(
      padding: const EdgeInsets.only(top: 20 ,bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
      children: [
Padding(
  padding: const EdgeInsets.only(top: 10 ,bottom: 10.0),
  child: Row(
    children: [
      Icon(Icons.bedroom_parent_outlined),
      Padding(
        padding: const EdgeInsets.only (left:10.0),
        child: Text('Bedrooms'),
      ),




    ],
  ),
),
        Wrap(
          verticalDirection: VerticalDirection.down,
          spacing: 5,
          children:


          List.generate (dataProviderModel.bedrooms.length, (index) =>
              Consumer<DashBoardviewModel>(
                builder: (context, dataProviderModel, child) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5,bottom: 10),
                    child: GestureDetector(
                      onTap: () async {
                        dataProviderModel.showButtonLoading();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:   Colors.transparent,
                          borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
                          border: Border.all(
                            width: 1,
                            color: AppColor.secondary, // Define border color
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10 ,bottom: 10 ,right: 20 ,left: 20),
                          child: Text(
                            dataProviderModel.bedrooms[index],
                            style:  Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  );





                },
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10 ,bottom: 10.0),
          child: Row(
            children: [
              Icon(Icons.bathtub_outlined),
              Padding(
                padding: const EdgeInsets.only (left:10.0),
                child: Text('Bathrooms'),
              ),

            ],
          ),
        ),
        Wrap(
          verticalDirection: VerticalDirection.down,
          spacing: 5,
          children:


          List.generate (dataProviderModel.bathrooms.length, (index) =>
              Consumer<DashBoardviewModel>(
                builder: (context, dataProviderModel, child) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5,bottom: 10),
                    child: GestureDetector(
                      onTap: () async {
                        dataProviderModel.showButtonLoading();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:   Colors.transparent,
                          borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
                          border: Border.all(
                            width: 1,
                            color: AppColor.secondary, // Define border color
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10 ,bottom: 10 ,right: 20 ,left: 20),
                          child: Text(
                            dataProviderModel.bathrooms[index],
                            style:  Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                  );





                },
              ),
          ),
        ),


      ],
      ),
      ),

      )
      else if(dataProviderModel.items[index]==dataProviderModel.items[4]) Center(
      child:   Padding(
      padding: const EdgeInsets.only(top: 20 ,bottom: 10),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Padding(
      padding: const EdgeInsets.only(top: 10 ,bottom: 10.0),
      child: Row(
      children: [
        const AnimatedEmoji(
          AnimatedEmojis.fire,
          size: 20,
        ),
      Padding(
      padding: const EdgeInsets.only (left:10.0),
      child: Text('Most popular'),
      ),




      ],
      ),
      ),
        Wrap(
        verticalDirection: VerticalDirection.down,
        spacing: 5,
        children:


        List.generate (dataProviderModel. popularFeatures.length, (index) =>
        Consumer<DashBoardviewModel>(
        builder: (context, dataProviderModel, child) {
        return Padding(
        padding: const EdgeInsets.only(left: 5,bottom: 10),
        child: GestureDetector(
        onTap: () async {
        dataProviderModel.showButtonLoading();
        },
        child: Container(
        decoration: BoxDecoration(
        color:   Colors.transparent,
        borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
        border: Border.all(
        width: 1,
        color: AppColor.secondary, // Define border color
        ),
        ),
        child: Padding(
        padding: const EdgeInsets.only(top: 10 ,bottom: 10 ,right: 20 ,left: 20),
        child: Text(
        dataProviderModel.popularFeatures[index],
        style:  Theme.of(context).textTheme.bodyMedium,
        ),
        ),
        ),
        ),
        );





        },
        ),
        ),
        ),
        Padding(
        padding: const EdgeInsets.only(top: 10 ,bottom: 10.0),
        child: Row(
        children: [
        Text('Featured Amenities'),

      ],
      ),
      ),
      Wrap(
      verticalDirection: VerticalDirection.down,
      spacing: 5,
      children:


      List.generate (dataProviderModel.features.length, (index) =>
      Consumer<DashBoardviewModel>(
      builder: (context, dataProviderModel, child) {
      return Padding(
      padding: const EdgeInsets.only(left: 5,bottom: 10),
      child: GestureDetector(
      onTap: () async {
      dataProviderModel.showButtonLoading();
      },
      child: Container(
      decoration: BoxDecoration(
      color:   Colors.transparent,
      borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
      border: Border.all(
      width: 1,
      color: AppColor.secondary, // Define border color
      ),
      ),
      child: Padding(
      padding: const EdgeInsets.only(top: 10 ,bottom: 10 ,right: 20 ,left: 20),
      child: Text(
      dataProviderModel.features[index],
      style:  Theme.of(context).textTheme.bodyMedium,
      ),
      ),
      ),
      ),
      );





      },
      ),
      ),
      ),


      ],
      ),
      ),

      ),
        
        const Padding(
        padding: EdgeInsets.only(top:5),
        child: Divider(
        thickness:1,
        color: AppColor.grey,
        
        ),
        ),
        Consumer<DashBoardviewModel>(
        builder: (context, dataProviderModel, child)
        {
        return
        Center(
          child: ElevatedButton(onPressed:(){
          //todo:Only show the filtered properties
        Navigator.of(context).pop();
          },
          style:
        
          ElevatedButton.styleFrom(
          fixedSize: Size(300, 45),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5, backgroundColor:  dataProviderModel.searchButtonState ? AppColor.grey: AppColor.secondary
          ), child: dataProviderModel.searchButtonState ?
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: AppColor.white,
                strokeWidth: 4.0,
              ),
            ):

            Text(
          '${dataProviderModel.numberProperties} available listings',
          style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: AppColor.white
          ),
        
          ),
          ),
        );
        }
        ),
        
        ],
        ),
      ),
      ),
      );
      }

    );
  }


  );



}
/*
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
*/
