import 'package:flutter/material.dart';


class FiveRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TECFOOD"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () => {
                  Navigator.pop(context)
                },
                color: Colors.white,
                padding: EdgeInsets.all(10.0),
                child: Row( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Image.network("https://cdn.pixabay.com/photo/2019/03/18/08/13/peru-4062570_960_720.png",width: 50,height: 100,),
                    Text("      +54 973696215",style: TextStyle(color: Colors.black,fontSize: 20),)
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}