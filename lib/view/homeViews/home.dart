import 'package:flutter/material.dart';
import 'package:visanka/theme/color.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:visanka/viewModel/home_view_model.dart';

import 'home_view.dart';

class Home extends StatefulWidget {
  static const id ='/home';
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selected=0;
  PageController controller =PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColor.primary,
        bottomNavigationBar: StylishBottomBar(

          items: [
            BottomBarItem(
                icon: const Icon(
                    Icons.house_outlined
                ),
                title: const Text('Home'),
                selectedColor: AppColor.secondary,
                unSelectedColor:AppColor.grey,
            ),
            BottomBarItem(
              icon: const Icon(
                  Icons.explore_sharp
              ),
              title: const Text('Home'),
              selectedColor: AppColor.secondary,
              unSelectedColor:AppColor.error,
              selectedIcon: Icon(
                  Icons.explore_sharp
              ),
            ),

            BottomBarItem(
              icon: const Icon(
                  Icons.favorite_border_sharp
              ),
              title: const Text('Saved'),
              selectedColor: AppColor.secondary,
              unSelectedColor: AppColor.grey,
            ),
            BottomBarItem(
                icon: const Icon(
                    Icons.person_outline_sharp
                ),
                selectedIcon: Icon(
                    Icons.person
                ),
                title: const Text('My Account'),
                selectedColor: AppColor.secondary,
                unSelectedColor: AppColor.grey,
            )
          ],
          currentIndex: selected,
          onTap: (index) {
            setState(() {
              selected = index;
            });
            controller.jumpToPage(index);
          },
          option: BubbleBarOptions(
            barStyle: BubbleBarStyle.vertical,
            bubbleFillStyle: BubbleFillStyle.fill
          )
        ),
        body: SafeArea(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children:  [
Dash()
            ],
          ),
        ),
      ),
    );
  }
}
