import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthtracker/screens/rating.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/apiController.dart';
import './home.dart';

class Symptoms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SymptomsState();
  }
}

class _SymptomsState extends State<Symptoms> {
  // se agregaron nuevos sintomas que aplican a todos los trimestres de embarazo
  int _rating = 0;
  int _sangrados = 0;
  int _cabeza = 0;
  int _movimiento = 0;
  int _fluido = 0;
  int _contracciones = 0;

  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ]),
                    child: Form(
                        child: Column(
                      children: [
                        Text(
                          "Registre sus síntomas",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ))),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 165, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color:
                                  Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ]),
                    child: Form(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  1.  Movimiento fetal",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                                child: Column(children: [
                              Rating((value) {
                                _movimiento = value;
                              }, (rating) {
                                setState(() {
                                  _rating = rating;
                                });
                              })
                            ]))),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "  2.  Sangrado vaginal",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                                child: Column(children: [
                              Rating((value) {
                                _sangrados = value;
                              }, (rating) {
                                setState(() {
                                  _rating = rating;
                                });
                              })
                            ]))),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "  3.  Fuga de fluido vaginal",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                                child: Column(children: [
                              Rating((value) {
                                _fluido = value;
                              }, (rating) {
                                setState(() {
                                  _rating = rating;
                                });
                              })
                            ]))),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "  4.  Contracciones",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                                child: Column(children: [
                              Rating((value) {
                                _contracciones = value;
                              }, (rating) {
                                setState(() {
                                  _rating = rating;
                                });
                              })
                            ]))),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "  5.  Dolor de cabeza",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Form(
                                child: Column(children: [
                              Rating((value) {
                                _cabeza = value;
                              }, (rating) {
                                setState(() {
                                  _rating = rating;
                                });
                              })
                            ]))),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ))),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 700, horizontal: 20),
                    child: Form(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              ApiController controller = new ApiController();
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              int idUsuario = json.decode(sharedPreferences
                                  .getString('userData'))["id_usuario"];
                              bool added = await controller.registrarSintomas(
                                  _cabeza,
                                  _sangrados,
                                  _movimiento,
                                  _fluido,
                                  _contracciones,
                                  idUsuario);
                              if (added) {
                                Navigator.push(
                                    context,
                                    new CupertinoPageRoute(
                                        builder: (context) => Home()));
                              } else {
                                print("No se pudo guardar el registro");
                              }
                            },
                            child: Text("Registrar",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).accentColor)),
                            style: ElevatedButton.styleFrom(
                                elevation: 8,
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50))),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ))),
              ])
            ],
          ),
        ),
      );
}
