import 'dart:convert';
import 'package:codelabs/screen/Login.dart';
import 'package:codelabs/screen/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:codelabs/screen/menu_lateral.dart';

class Menus extends StatefulWidget {
  @override
  _MenusState createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  
  final url = "https://jsonplaceholder.typicode.com/posts";

  var _postsJson = [];

  List lista = [
    "https://images-ext-1.discordapp.net/external/WWflvSKcawNxdERg-1Ab7BLARkD2oYSPCScd-bVx_08/http/www.comedera.com/wp-content/uploads/2014/08/IMG_4792111111.jpg",
    "https://images-ext-2.discordapp.net/external/iiRGqxEAsjwUNYKw1Cez1JHpW9dCG3MaLi-hl1adZVg/https/ichef.bbci.co.uk/news/800/cpsprodpb/134E3/production/_105057097_a226d870-cc5f-4043-9f4b-d452b75cc280.jpg",
    "https://images-ext-2.discordapp.net/external/0RZD2EV6YtnNi8-llwRu9K6IpH-MSClIg16h190lHeo/https/libroderecetas.com/files/recetas/mejores-platos-de-la-comida-caribena.jpg",
    "https://images-ext-2.discordapp.net/external/jDmy29N5wXpgnuqPdM-P84VkT106LUtYBn1QhJg6yEU/https/www.comedera.com/wp-content/uploads/2013/10/100-platos-que-deberias-comer-antes-de-morir.jpg",
    "https://images-ext-2.discordapp.net/external/juS6MlQH-Uts-GvywluFRmACd9D4YEkntJCYve7rcCQ/https/elviajerofeliz.com/wp-content/uploads/2019/10/irlanda4-min.jpg",
    "https://media.discordapp.net/attachments/838483333469044806/855494310500761628/2Q.png"
    "https://images-ext-2.discordapp.net/external/cG7whsQ2KwmXZIZGNOuvn8b2cakyz6_u8ld7ffnArwM/https/estaticos.miarevista.es/media/cache/1140x_thumb/uploads/images/gallery/59f6f86d5bafe8699bf7fdf3/segundosinterior.jpg",
    "https://images-ext-1.discordapp.net/external/TAvNjtZqmVZLoUH3vZUG2YQ81niZiO1Mn75qU_y_ZCo/%3Fq%3Dtbn%3AANd9GcRcnTfCOl60fCNmbRL8w5z0G1iUGkHrG0IPxg%26usqp%3DCAU/https/encrypted-tbn0.gstatic.com/images",
    "https://images-ext-1.discordapp.net/external/P_o2mtyz_VwUTMAougyj1zaoNOeUjXvC8H-SrnVMvFw/%3Fq%3Dtbn%3AANd9GcSGkbohAqJHKZIweAEFypeICBiSrkbnLgrfmA%26usqp%3DCAU/https/encrypted-tbn0.gstatic.com/images",
    "https://media.discordapp.net/attachments/838483333469044806/855494997989654578/450_1000.png",
  ];

  void fetchPosts() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }


  @override
  Widget build(BuildContext context) {
    fetchPosts();
    return Scaffold(
        appBar: AppBar(
          title: Text("TECFOOD"),
          backgroundColor: Colors.orange,
        ),
        drawer: MenuLateral(),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, i) {
            final post = _postsJson[i];
            return Padding(
              padding: EdgeInsets.all(20),
              child: Card(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Image.network(lista[i]),
                    Text(
                      "${post["title"]}",
                      style: TextStyle(height: 2, fontSize: 20),
                    ),
                    Text(
                      "${post["body"]} ",
                      style: TextStyle(height: 1, fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    Icon(
                      Icons.favorite,
                      color: Colors.yellow,
                      size: 40,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        );
  }
}