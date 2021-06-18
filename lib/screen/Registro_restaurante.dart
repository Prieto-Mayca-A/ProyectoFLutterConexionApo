import 'package:flutter/material.dart';
import 'package:codelabs/screen/Api.dart';

class REGISTRO_RESTAURANTE extends StatelessWidget  {
  TextEditingController DNI = TextEditingController();
  TextEditingController NombreRestaurante = TextEditingController();
  TextEditingController Ubicacion = TextEditingController();
  TextEditingController Direccion = TextEditingController();
  TextEditingController Descripcion = TextEditingController();
  TextEditingController Contacto = TextEditingController();
  TextEditingController Puntuacion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Image.asset('images/tecfood.jpg'),
                 Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: DNI,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'DNI',
                    ),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: NombreRestaurante,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre del restaurante',
                    ),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: Ubicacion,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Ubicacion',
                    ),
                  ),
                ),
                 Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: Direccion,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Direccion',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: Descripcion,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descripcion',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: Contacto,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contacto',
                    ),
                  ),
                ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.orange,
                      child: Text('REGISTRAR REST.'),
                      onPressed: () {
                        Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => Api()),
                        );  
                      },
                    )),
              ],
            )));
  }
}
