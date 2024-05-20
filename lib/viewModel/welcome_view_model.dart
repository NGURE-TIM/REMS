import 'package:flutter/cupertino.dart';
import 'package:visanka/models/onboard_model.dart';

class WelcomeViewModel extends ChangeNotifier{
  List<String> get buttons => Welcome.buttonsRow1;
  List<bool> get buttonStates =>   Welcome.buttonStatesRow1;

toggleButtonState(int index){
  for (int i = 0; i < buttonStates.length; i++) {
    buttonStates[i] = (i == index);
  }

  notifyListeners();
}

}