import 'package:cf_flutter/services/parimpar_service.dart';
import 'package:flutter/material.dart';
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
    poIService.xParOImpar.r = "";
    poIService.xParOImpar.numero = 0;

    return MaterialApp(
      title: "appletenhtml",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Resultado ${poIService.xParOImpar.r}"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: Text(
              "Ejemplo Sacando numero par o impar",
              style: TextStyle(fontSize: 24),
            )),
          ],
        ),
      ),
    );
  }
}
