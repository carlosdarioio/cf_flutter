import 'package:cf_flutter/services/parimpar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class ParOImpar extends StatefulWidget {
  ParOImpar({Key key}) : super(key: key);

  @override
  _ParOImparState createState() => _ParOImparState();
}

class _ParOImparState extends State<ParOImpar> {
  @override
  Widget build(BuildContext context) {
    final poIService = Provider.of<ParOImparService>(context, listen: true);    
    final cnumero = TextEditingController();

    return MaterialApp(
      title: "appletenhtml",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Resultado ${poIService.r}"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: Text(
              "Ejemplo Sacando numero par o impar",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            )),
            TextField(
              controller: cnumero,
              decoration: InputDecoration(hintText: "Poner numero"),
              textAlign: TextAlign.center,
            ),
            Text(
              "R: ${poIService.r}",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  poIService.numero = int.parse(cnumero.text);
                  poIService.calcular();
                  setState(() {});
                },
                child: Text('Calcular'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
