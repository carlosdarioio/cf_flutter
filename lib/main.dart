import 'package:cf_flutter/buscarArticulos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/product_service.dart';
//Edit editando formato inicial


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new ProductService()),        
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Practicando Flutter',
          initialRoute: 'Articulos',
          routes: {
            'Articulos': (_) => BuscarArticulos(),
          },
          theme: ThemeData(
            // Define the default brightness and colors.
            brightness: Brightness.light,
            primaryColor: Colors.lightGreen[700],
            accentColor: Colors.yellow[600],
            buttonColor: Colors.grey,
            // Define the default font family.
            fontFamily: 'Georgia',
            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
              bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            ),
          )),
    );
  }
}
