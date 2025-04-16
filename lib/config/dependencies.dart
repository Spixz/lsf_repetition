import 'package:flutter/material.dart';

class GlobalValues {
  GlobalValues();

  int counter = 0;

  void up() {
    counter++;
  }
}

class MyUser extends ChangeNotifier {
  String _name = 'Paul';
  String _lastname = 'Ma';
  int _age = 42;

  String get fullname => "$_name $_lastname";
  int get age => _age;

  void changeInfos([String? name, String? lastname, int? age]) {
    if (hash == Object.hash(name, lastname, age)) {
      return;
    }
    _name = name ?? _name;
    _lastname = lastname ?? _lastname;
    _age = age ?? _age;
    notifyListeners();
  }

  void incrementAge() {
    _age++;
    notifyListeners();
  }

  int get hash => Object.hash(_name, _lastname, _age);
}
