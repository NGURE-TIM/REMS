import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visanka/theme/color.dart';
import 'package:visanka/view/onBoardViews/property_view.dart';
import 'package:visanka/viewModel/welcome_viewModel.dart';


class Welcome extends StatefulWidget {
  static const id = '/welcome';

  const Welcome({Key? key}) : super(key: key);


  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  final  WelcomeViewModel _viewModel = WelcomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Scaffold(
         backgroundColor: AppColor.primary,
       ),
        SafeArea(child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/images/splash/REMlogo.png"),
                  ),
                ),
                RichText(
                  text:  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: "Welcome to ",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      TextSpan(
                        text: "Real Estate Management",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Let's dive in, shall we ?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'My primary interest is to ..',
                style: Theme.of(context).textTheme.titleMedium
                ),
                SizedBox(
                  height: 30,
                ),
                Column(

                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(2, (index)
                          {
                            return outlinedButton(
                              _viewModel.buttons[index],
                                  () {
                                         Provider.of<WelcomeViewModel>(context , listen: false).toggleButtonState(index);

                                   Navigator.push(context, MaterialPageRoute(builder: (context) =>Property( _viewModel.buttons[index])),);

                              },
                          index,
                            );
                          }
                      )
                    ),

                  ],
                )
              ],
            ),
          ),
        )),
      ],
    );

  }

 outlinedButton(String text, Function () onTap ,int index) {

    return Consumer<WelcomeViewModel>( builder:(context,dataProviderModel,child){
      return InkWell(
        highlightColor: null,
        splashColor: AppColor.primary ,
        radius: 20,
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
            width: 140,
            height: 70,
            decoration: BoxDecoration(
              color:dataProviderModel.buttonStates[index]?AppColor.primary:Colors.transparent,
              borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
              border: Border.all(
                width: 1,
                color: AppColor.secondary, // Define border color
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: dataProviderModel.buttonStates[index] ? Theme.of(context).textTheme.bodyLarge:Theme.of(context).textTheme.bodyMedium,
              ),
            )
        ),
      );
    });
 }
}
