import 'package:flutter/material.dart';



class CartPage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:AppBar(
        title:Text("居中") ,
      ),
      body: Container(
        color: Colors.green,
        alignment: Alignment.center,
        child: Text("居中"),
      )
      
    );

  }
}