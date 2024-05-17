import 'package:flutter/material.dart';
import 'package:visanka/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:visanka/view/onBoardViews/welcome_View.dart';
import 'package:visanka/view/onBoardViews/city_view.dart';
import 'package:visanka/view/Spashscreen/splash.dart';
import 'package:visanka/viewModel/city_viewModel.dart';
import 'package:visanka/viewModel/property_viewModel.dart';
import 'package:visanka/viewModel/welcome_viewModel.dart';

void main() {
  runApp(const REM());
}

class REM extends StatelessWidget {
  const REM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>WelcomeViewModel()),
        ChangeNotifierProvider(create: (context)=>CityViewModel()),
        ChangeNotifierProvider(create: (context)=>PropertyViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:Splash.id,
        routes: {

      Splash.id:(context)=>Splash(),
          Welcome.id:(context)=>Welcome(),
          City.id:(context)=>City(),
        },
        title: 'REM',
        home: const Splash(),
        theme: AppTheme.Theme(),

      ),
    );
  }
}



