import 'package:flutter/material.dart';

class YearBisiestoService with ChangeNotifier {
  int numero = 0;
  String r = "";

  void CalculandoYearBisiesto() {
    if ((((numero % 100) != 0) && ((numero % 4) == 0)) ||
        ((numero % 400) == 0)) {
      r = "El Año $numero es Bisiesto";
    } else {
      r = "El Año $numero No es Bisiesto";
    }
  }
}
