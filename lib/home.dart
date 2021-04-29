import 'package:cf_flutter/questions.dart';
import 'package:cf_flutter/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String answer1 = '';
    String answer2 = '';
    String answer3 = '';
    bool saved = false;
    final usuarioService = Provider.of<UsuarioService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Definiendo respuestas'),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        TextFormField(
                          
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Nombre de tu mascota',
                            labelText: 'Poner Nombre de tu mascota',
                          ),
                          onChanged: (value) {
                            
                              answer1 = value;
                              
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Nombre de tu juego favorito',
                            labelText: 'Poner Nombre de tu juego favorito',
                          ),
                          onChanged: (value) {
                            
                              answer2 = value;
                            
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Ya te dio Covid?',
                            labelText: 'Confirmar, Si Ya te dio Covid?',
                          ),
                          onChanged: (value) {
                            
                              answer3 = value;
                            
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              usuarioService.numero1 = answer1;
                              usuarioService.numero2 = answer2;
                              usuarioService.numero3 = answer3;
                              setState(() {
                                saved = true;
                              });
                            },
                            child: Text('Guardar')),
                        (saved)
                            ? Text(
                                'Respuestas Guardadas, esperar 3 dias para responderlas',
                                style: TextStyle(color: Colors.red),
                              )
                            : Text(''),
                      ].expand(
                        (widget) => [
                          widget,
                          SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons: <Widget>[
        new IconButton(
            icon: new Icon(Icons.question_answer), onPressed: () => null),
        new IconButton(
            icon: new Icon(Icons.event_available_sharp), onPressed: () => {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Questions()),
            )}),
      ],
    );
  }
}
