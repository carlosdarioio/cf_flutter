import 'package:cf_flutter/models/numeros.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  int numero1 = 0;
  int numero2 = 0;

  int sumar() {
    return numero1 + numero2;
  }
}
