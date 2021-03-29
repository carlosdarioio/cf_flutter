import 'package:cf_flutter/models/articulos.dart';
import 'package:cf_flutter/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//Pendiente separar cuerpo todo esta dentro de BuscarArticulos
List<Articulos> lista_articulos = [];

class BuscarArticulos extends StatefulWidget {
  BuscarArticulos({Key key}) : super(key: key);
  _BuscarArticulosState createState() => _BuscarArticulosState();
}

class _BuscarArticulosState extends State<BuscarArticulos> {
  //borrar
  final TextStyle xTextStyle = TextStyle(color: Colors.black, fontSize: 18);

//asignando colores
  final primary = Color(0xff85b774);
  final secondary = Color(0xffbf376b);

//variable para contener los articulos a mostrar
  List<Articulos> articulos = [];

  @override
  Widget build(BuildContext context) {
    final articuloService = Provider.of<ProductService>(context, listen: true);
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                //obtendiendo articulos
                child: FutureBuilder(
                    future: cargarArticulos(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      //so obtiene datos
                      if (snapshot.hasData) {
                        if (articulos.length <= 0) {
                          articulos = snapshot.data;
                        }
                      }
                      return snapshot.hasData
                          ? ListView.builder(
                              itemCount: articulos.length,
                              itemBuilder: (BuildContext context, int index) {
                                return buildList(context, index);
                              })
                          : Center(child: CircularProgressIndicator());
                    }),
              ),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Buscando Articulos",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          //realizando busqueda por cada escritura
                          onChanged: (value) async {
                            if (value.length > 0) {
                              articulos = lista_articulos
                                  .where((food) => food.name
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                  .toList();
                            }
                            setState(() {});
                          },
                          cursorColor: Theme.of(context).primaryColor,
                          style: xTextStyle,
                          decoration: InputDecoration(
                              hintText: "Buscar",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//Informacion Articulo
  Widget buildList(BuildContext context, int index) {
    //Dialogo para mostrar mas informacion del articulo
    Future<void> _mostrarDetallesProduct(Articulos articulo) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(articulo.sku),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(articulo.shortDescription),
                  Text('Este es un diálogo de alerta de demostración.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Cerrar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return GestureDetector(
      onTap: () {
        _mostrarDetallesProduct(articulos[index]);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 125,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(width: 3, color: secondary),
                image: DecorationImage(
                    image: NetworkImage(articulos[index].picture),
                    fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    articulos[index].name,
                    style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        color: secondary,
                        size: 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Precio: ' + articulos[index].price.toString(),
                          style: TextStyle(
                              color: primary, fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.confirmation_number,
                        color: secondary,
                        size: 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                          'Existencia ' +
                              articulos[index].stockquantity.toString(),
                          style: TextStyle(
                              color: primary, fontSize: 13, letterSpacing: .3)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Funcion para obtener los articulos
Future<List<Articulos>> cargarArticulos() async {
  var jsonString = await rootBundle.loadString('assets/json/jsondata.json');
  final jsonResponse = articulosFromJson(jsonString);
  List<Articulos> articulos = [];
  lista_articulos = jsonResponse;
  articulos = lista_articulos;
  return articulos;
}
