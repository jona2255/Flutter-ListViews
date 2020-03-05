import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pantalla2 extends StatefulWidget {

  var elemento;

  Pantalla2(this.elemento);

  @override
  _Pantalla2State createState() => _Pantalla2State();
}

class _Pantalla2State extends State<Pantalla2> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.elemento),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            setState(() {
              count++;
            });
          },
          child: Text("count = " + count.toString()),
        ),
      ),
    );
  }
}