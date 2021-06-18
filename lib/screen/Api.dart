import 'dart:convert';
import 'dart:html';
import 'package:codelabs/screen/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:codelabs/screen/menu_lateral.dart';

class Api extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Api> {
  
  final url = "https://www.tecfood.club/74054946816/api/Restaurante";

  var _postsJson = [];
  
  void fetchPosts() async {
    try{
    final response = await get(Uri.parse(url));
    final jsonData = jsonDecode(response.body) as List;
    
    setState(() {
      _postsJson = jsonData;
    });

    }catch(err){}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context){
    fetchPosts();
    return Scaffold(
     appBar: AppBar(
        title: Text("TECFOOD"),  
        backgroundColor: Colors.orange,
      ),
      drawer: MenuLateral(),
        body: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (context, i){
            final post = _postsJson[i];
            return Text("Nombre del Restaurante: ${post["nombre_rest"]}\n\n Imagen del restaurante: ${post["ubicacion"]}\n\n");
          }
          ),
    );
  }
}