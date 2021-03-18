import 'package:cf_flutter/models/paroimparmodel.dart';
import 'package:flutter/material.dart';

class ParOImparService with ChangeNotifier {
  int numero = 0;
  String r = "";

  void calcular() {
    r = (numero % 2 == 0) ? "Par" : "Impar";
  }
}
