import 'package:flutter/material.dart';

class SliderProvider extends ChangeNotifier {
  double sliderValue = 20.0;

  void sliderValueChange(value) {
    sliderValue = value;
    print(sliderValue);
    notifyListeners();
  }
}
