import 'package:flutter/material.dart';
import 'package:visanka/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:visanka/view/onBoardViews/welcome_View.dart';
import 'package:visanka/view/onBoardViews/city_view.dart';
import 'package:visanka/view/Spashscreen/splash.dart';
import 'package:visanka/viewModel/city_view_model.dart';
import 'package:visanka/viewModel/home_view_model.dart';
import 'package:visanka/viewModel/property_view_model.dart';
import 'package:visanka/viewModel/welcome_view_model.dart';
import 'package:visanka/view/homeViews/home.dart';
import 'package:visanka/view/homeViews/unit_view.dart';
void main() {
  runApp(const REM());
}

class REM extends StatelessWidget {
  const REM({Key? key}) : super(key: key);
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_,ThemeMode currentMode ,__){
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>WelcomeViewModel()),
            ChangeNotifierProvider(create: (context)=>CityViewModel()),
            ChangeNotifierProvider(create: (context)=>PropertyViewModel()),
            ChangeNotifierProvider(create: (context)=>DashBoardviewModel()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute:Splash.id,
            routes: {

              Splash.id:(context)=>Splash(),
              Welcome.id:(context)=>Welcome(),
              City.id:(context)=>City(),
              Home.id:(context)=>Home(),
              Unit.id:(context)=>Unit(),
            },
            title: 'REM',
            home: const Splash(),
            theme: AppTheme.Theme(),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,

          ),
        );
      }
    );
  }
}

/*  leading:  IconButton(
              icon: Icon(REM.themeNotifier.value == ThemeMode.light
    ? Icons.dark_mode
        : Icons.light_mode),
    onPressed: () {
      REM.themeNotifier.value =
      REM.themeNotifier.value == ThemeMode.light
    ? ThemeMode.dark
        : ThemeMode.light;
    }),*/


