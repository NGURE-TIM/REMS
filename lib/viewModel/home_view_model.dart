

import 'package:flutter/cupertino.dart';
import 'package:visanka/models/home_model.dart';

class DashBoardviewModel extends ChangeNotifier {
  List items = DashBoardModel.items;
  List states=DashBoardModel.states;
 changeState(int index) {
   for (int i = 0; i < states.length; i++) {
     states[i] = (i == index);
   }

   notifyListeners();
 }
}
