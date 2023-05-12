import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  List<String> mainList = [];
  void addStrings() {
    //TODO1 сделать, чтобы работало добавление
    mainList.addAll(List<String>.from(['1', '2', '3', '4', '5']));
    notifyListeners();
  }

  void removeString() {
    //TODO2 убирать 2 последних строки
  }

  //TODO4
  //Дан массив данных размером N [13, 12, 15, 11, 9. 12, 16]
  //Это температура за каждый день
  //Нужно для каждого элемента массива найти колво дней до наступления более теплого дня
  //Очистить mainList и вывести вместо текстовых чисел пары чисел Температура - Количество днея до более теплого дня в виде Row.
}
