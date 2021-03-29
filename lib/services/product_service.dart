import 'package:flutter/material.dart';

class ProductService with ChangeNotifier {
  int numero1 = 0;
  int numero2 = 0;

  int sumar() {
    return numero1 + numero2;
  }
}
