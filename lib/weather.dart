import 'package:flutter/foundation.dart';

class Weather with ChangeNotifier{

  String tempType = 'celcius';
  int tempValue = 25;

  int get getTempValue => tempValue;
  String get getTempType => tempType;

  set temperature(int newTemp) {
    tempValue = newTemp;
    notifyListeners();
  }

  set temperatureType(String newType) {
    tempType = newType;
    notifyListeners();
  }
}
