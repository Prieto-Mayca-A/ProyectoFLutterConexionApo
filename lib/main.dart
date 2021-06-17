import 'package:flutter/material.dart';
import 'package:codelabs/screen/Login.dart';

List<Widget> listado( List<dynamic> info ){

  List<Widget> lista = [];
  info.forEach((elemento) {
    lista.add(Text(elemento["name"]));
  });
  return lista;
}

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox( height: 30,),
            Image.asset('images/tecfood.jpg'),
          Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.orange,
                      child: Text('Siguiente'),
                      onPressed: () {
                         Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => TECFOOD()),
                        );
                      },
                    )),  
          ],
        ),
      ),
    );
  }
}

