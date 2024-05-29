import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int number = 0;
  String name = "Nitish Kumar";
  double value = 3.4;

  void increaseValue() {
    number++;
    print(number);
    notifyListeners();
  }

  void decreaseValue() {
    number--;
    print(number);
    notifyListeners();
  }
}
