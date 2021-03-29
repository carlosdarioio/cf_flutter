import 'package:cf_flutter/services/yearbisiesto_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YearBisiesto extends StatefulWidget {
  const YearBisiesto({Key key}) : super(key: key);

  @override
  _YearBisiestoState createState() => _YearBisiestoState();
}

class _YearBisiestoState extends State<YearBisiesto> {
  @override
  Widget build(BuildContext context) {
    final yb = Provider.of<YearBisiestoService>(context, listen: true);
    final numeroController = TextEditingController();
    return MaterialApp(
      title: "appletenhtml",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Resultado ${yb.r} "),
        ),
        body: Column(
          children: <Widget>[
            Center(
                child: Text(
              "Sacando Year Siniestro",
              style: TextStyle(fontSize: 24),
            )),
            TextField(
              controller: numeroController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  yb.numero = int.parse(numeroController.text);
                  yb.CalculandoYearBisiesto();
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
