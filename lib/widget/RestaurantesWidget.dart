import 'package:flutter/material.dart';
import 'package:codelabs/models/restaurante.dart';

class RestaurantesWidget extends StatelessWidget {

  final List<Restaurante> restaurantes;

  RestaurantesWidget({required this.restaurantes});

 @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: restaurantes.length,
      itemBuilder: (context, index) {

        final restaurante = restaurantes[index];

        return ListTile(
          title: Row(children: [
            SizedBox(
              width: 100, 
              child: ClipRRect(
                child: Image.network(restaurante.vista), 
                borderRadius: BorderRadius.circular(10),
              )
             
            ), 
            Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [
                  Text(restaurante.nombre_rest),
                  Text(restaurante.descripcion)
              ],),
                ),
            )
          ],)
        );
      }
    );
    
  }

}