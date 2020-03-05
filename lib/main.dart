import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Pantalla2.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    leerJson();
  }
  var elementos = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.amber,
          items: [
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
          ],
          onTap: (index){},
        )

          ,
          appBar: AppBar(
              title: Text("Pantalla 1")
          ),
          body: Container(
            color: Colors.amber,
            child: ListView.builder(
              itemCount: elementos.length,
              itemBuilder: (context, index) =>
                  Container(
                    padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),

                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => (Pantalla2(elementos[index]["author"])),
                          ));
                        },
                        child: Text(elementos[index]["quote"]),
                      )),
            ),
          )
      ),
    );
  }

  leerJson() async{
    var archivo = await http.get("https://raw.githubusercontent.com/gerardfp/quotes/master/quotes.json");

    setState((){
      elementos = jsonDecode(archivo.body);
    });
  }
}
