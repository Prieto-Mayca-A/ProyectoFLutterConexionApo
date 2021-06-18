import 'package:flutter/material.dart';
import 'package:codelabs/screen/Login.dart';
import 'dart:async';
import 'dart:convert';
import 'package:codelabs/models/restaurante.dart';
import 'package:codelabs/widget/RestaurantesWidget.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;  

void main() {
  runApp(MaterialApp(
    home: ConexionApi(),
  ));
}

class ConexionApi extends StatefulWidget {
  @override
  _ConexionApi createState() => _ConexionApi();
}

class _ConexionApi extends State<ConexionApi> {
  List<Restaurante> _restaurantes = <Restaurante>[];

  @override
  void initState() {
    super.initState();
    _populateAllRestaurantes();
  }

  void _populateAllRestaurantes() async {
    final restaurantes = await _fetchAllRestaurantes();
    setState(() {
      _restaurantes = restaurantes;
    });
  }

  Future<List<Restaurante>> _fetchAllRestaurantes() async {
    final response = await http
        .get("https://www.tecfood.club/74054946816/api/Restaurante/?format=json");

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((restaurante) => Restaurante.fromJson(restaurante)).toList();
    } else {
      throw Exception("Fallo en cargar las peliculas!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Peliculas App",
        home: Scaffold(
            appBar: AppBar(title: Text("Peliculas")),
            body: RestaurantesWidget(restaurantes: _restaurantes)));
  }
}

//------------------------------------------------------------------------------------------------

class MyApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: SplasScreen(),  
      debugShowCheckedModeBanner: false,  
    );  
  }  
}  
  
class SplasScreen extends StatefulWidget {  
  @override  
  SplashScreenState createState() => SplashScreenState();  
}  
class SplashScreenState extends State<SplasScreen> {  
  @override  
  void initState() {  
    super.initState();  
    Timer(Duration(seconds: 3),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => TECFOOD()  
            )  
         )  
    );  
  }  
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
          ],
        ),
      ),
    );
  }
} 

List<Widget> listado( List<dynamic> info ){

  List<Widget> lista = [];
  info.forEach((elemento) {
    lista.add(Text(elemento["name"]));
  });
  return lista;
}
