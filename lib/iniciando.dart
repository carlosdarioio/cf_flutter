import 'package:cf_flutter/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Iniciando extends StatefulWidget {
  //const Iniciando({Key key}) : super(key: key);

  @override
  _IniciandoState createState() => _IniciandoState();
}

class _IniciandoState extends State<Iniciando> {
  @override
  Widget build(BuildContext context) {
    //final xusuario = Provider.of<UsuarioService>(context, listen: true);
    final num1Controller = TextEditingController();
    final num2Controller = TextEditingController();

    final usuarioService = Provider.of<UsuarioService>(context, listen: true);
    num1Controller.text = usuarioService.numero1.toString();
    num2Controller.text = usuarioService.numero2.toString();
    return MaterialApp(
      title: "appletenhtml",
      home: Scaffold(
          appBar: AppBar(
            title: Text(
                "Resultado ${usuarioService.numero1 + usuarioService.numero2}"),
          ),
          body: Form(
            //key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration:
                      InputDecoration(hintText: 'Please enter number 1'),
                  controller: num1Controller,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter number1';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(hintText: 'Please enter number 2'),
                  keyboardType: TextInputType.number,
                  controller: num2Controller,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter number2';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      usuarioService.numero1 = int.parse(num1Controller.text);
                      usuarioService.numero2 = int.parse(num2Controller.text);
                      //usuarioService.sumar();

                      setState(() {});
                    },
                    child: Text('Sumar'),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
