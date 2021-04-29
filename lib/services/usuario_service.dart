import 'package:cf_flutter/models/numeros.dart';
import 'package:flutter/material.dart';

class UsuarioService with ChangeNotifier {
  String numero1 = "";
  String numero2 = "";
  String numero3 = "";
}

//pendiente guardar repuestas en shared preference,
//iobtener respuestas cada vez que inicie el app
////asignar valores en provider