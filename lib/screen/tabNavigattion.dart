import 'dart:convert';
import 'package:codelabs/screen/Login.dart';
import 'package:codelabs/screen/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:codelabs/screen/menu_lateral.dart';

class Api extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Api> {
  
  final url = "https://jsonplaceholder.typicode.com/posts";

  var _postsJson = [];

  List lista = [
    "https://images-ext-2.discordapp.net/external/PTOl0nZQ4a63K8fjAJKSrSg_ByVKAlsMMgudTQ33iJk/https/gestion.pe/resizer/FkkXX6kmWI6EgkqeXi7bNRBevzU%3D/580x330/smart/filters%3Aformat%28jpeg%29%3Aquality%2875%29/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/UIHUZAOLA5DSVDSL3HCV6ICOZ4.jpg",
    "https://images-ext-1.discordapp.net/external/M6a4JgjRXqXmKk9m5lp9ehYYj1RiqPu6zty92qun2hU/https/t1.salir.ltmcdn.com/es/places/2/5/7/img_130752_ceviche-103_0_orig.jpg",
    "https://images-ext-1.discordapp.net/external/KnByDotXBm3VhiEvuAKLQuvI99cn1cQzcpHcQ_j7U4E/https/media-cdn.tripadvisor.com/media/photo-s/08/2d/f0/82/fuente-liverpool-coquimbo.jpg",
    "https://images-ext-1.discordapp.net/external/k8m1m4x8XeVJkXPFKQXJ5QMlvFLSBFFdERszrtPxZE8/https/peru21.pe/resizer/tPsU3Lequ4RNSwzbsgyGp_Y5z0I%3D/980x0/smart/filters%3Aformat%28jpeg%29%3Aquality%2875%29/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/XVABF26XVZBJZFITHHFCVPKHW4.jpg",
    "https://images-ext-1.discordapp.net/external/M6a4JgjRXqXmKk9m5lp9ehYYj1RiqPu6zty92qun2hU/https/t1.salir.ltmcdn.com/es/places/2/5/7/img_130752_ceviche-103_0_orig.jpg",
    "https://images-ext-1.discordapp.net/external/KnByDotXBm3VhiEvuAKLQuvI99cn1cQzcpHcQ_j7U4E/https/media-cdn.tripadvisor.com/media/photo-s/08/2d/f0/82/fuente-liverpool-coquimbo.jpg",
    "https://images-ext-1.discordapp.net/external/k8m1m4x8XeVJkXPFKQXJ5QMlvFLSBFFdERszrtPxZE8/https/peru21.pe/resizer/tPsU3Lequ4RNSwzbsgyGp_Y5z0I%3D/980x0/smart/filters%3Aformat%28jpeg%29%3Aquality%2875%29/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/XVABF26XVZBJZFITHHFCVPKHW4.jpg",
    "https://images-ext-1.discordapp.net/external/M6a4JgjRXqXmKk9m5lp9ehYYj1RiqPu6zty92qun2hU/https/t1.salir.ltmcdn.com/es/places/2/5/7/img_130752_ceviche-103_0_orig.jpg",
    "https://images-ext-1.discordapp.net/external/KnByDotXBm3VhiEvuAKLQuvI99cn1cQzcpHcQ_j7U4E/https/media-cdn.tripadvisor.com/media/photo-s/08/2d/f0/82/fuente-liverpool-coquimbo.jpg",
    "https://images-ext-1.discordapp.net/external/k8m1m4x8XeVJkXPFKQXJ5QMlvFLSBFFdERszrtPxZE8/https/peru21.pe/resizer/tPsU3Lequ4RNSwzbsgyGp_Y5z0I%3D/980x0/smart/filters%3Aformat%28jpeg%29%3Aquality%2875%29/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/XVABF26XVZBJZFITHHFCVPKHW4.jpg",
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

_searchBar(){
    return Padding(
      padding:EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(hintText: '..Search'),
        onChanged: (text){
          text = text.toLowerCase();
          setState(() {
            _postsJson.where((post){
              var restTitle = post.title.toLowerCase();
              return restTitle.contains(text);
            }).toList();
          });
        },
      ),);
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