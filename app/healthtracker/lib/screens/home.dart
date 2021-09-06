import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './symptoms.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Center(
          child: ElevatedButton(
            onPressed: (){
              Navigator.push(
                  context, 
                  new CupertinoPageRoute(
                    builder: (context) => Symptoms())); //paciente.idUsuario
            }, 
            child: Text("Análisis"),
            style: ElevatedButton.styleFrom(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6)),
              padding: EdgeInsets.symmetric(
                vertical: 15, horizontal: 50
              )
            )
          ),
        )
      )
    );
  }
}