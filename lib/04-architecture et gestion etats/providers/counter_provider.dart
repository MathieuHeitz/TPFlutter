import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{

  int _value =0;

  int get value => _value;

  void increment(){
    _value ++; // modifier l'état
    notifyListeners(); //permet d'informer l'interface
  }

}