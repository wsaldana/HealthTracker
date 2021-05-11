import 'package:flutter/material.dart';

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
        child: Text(
          "Home",
          style: Theme.of(context).textTheme.headline3,
        )
      )
    );
  }
}