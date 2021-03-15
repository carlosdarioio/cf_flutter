import 'package:cf_flutter/models/numeros.dart';
import 'package:flutter/material.dart';



class UsuarioService with ChangeNotifier { 

  Numeros _numero;

  Numeros get numeros => this._numero;
  bool get existeUsuario => (this._numero != null) ? true : false;

  set usuario( Numeros nums ) {
    this._numero = nums;
    notifyListeners();
  }

  void cambiarNum1( int num ) {
    this._numero.num1 = num;
    notifyListeners();
  }
  void cambiarNum2( int num ) {
    this._numero.num2 = num;
    notifyListeners();
  }

  void removerNumeros(){
    this._numero = null;
    notifyListeners();
  }  

}