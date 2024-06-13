import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../theme/color.dart';
import '../../viewModel/home_view_model.dart';
//this view makes use of the home model
class Unit extends StatefulWidget {
  static const id = '/unit';
  const Unit({Key? key}) : super(key: key);

  @override
  State<Unit> createState() => _UnitState();
}

class _UnitState extends State<Unit> {
  DashBoardviewModel _boardviewModel =DashBoardviewModel();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.primary,
        ),
        SafeArea(child: Scaffold(

            body:CustomScrollView(
              slivers: [
                SliverAppBar(


                  actions: [Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      children: [
                        Icon( MdiIcons.heartOutline),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.share),

                      ],
                    ),
                  ),],
                  flexibleSpace: FlexibleSpaceBar(
                    background: FlutterCarousel(
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
                      items: _boardviewModel.unit[0].propertyImages.map((item) {
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

],
          );
        }
    )



                )
              ],
            )
        ))
      ],
    );
  }
}
