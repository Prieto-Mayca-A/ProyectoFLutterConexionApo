import 'package:flutter/material.dart';
import 'package:codelabs/screen/Login.dart';


class MenuLateral extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: Text("TECFOOD"),
              accountEmail: Text("tecfood@gmail.com"),
              
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://media-cdn.tripadvisor.com/media/photo-s/0c/47/c1/56/plaza-de-armas-arequipa.jpg"),
                fit: BoxFit.cover
              )
            ),
          ),
          Ink(
            color: Colors.grey,
            child: new ListTile(
              title: Text("OPCIONES DISPONIBLES:", style: TextStyle(color: Colors.white),),
            ),
          ),
          new ListTile(
            title: Text("CONFIGURACION"),
            onTap: (){},
          ),
          new ListTile(
            title: Text("INTEGRANTES"),
          ),
          new ListTile(
            title: Text("AGREGAR"),
          ),
          new ListTile(
            title: Text("SALIR"),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TECFOOD()),
            );
          },
          )

                 ],
      ) ,
    );
  }
}
