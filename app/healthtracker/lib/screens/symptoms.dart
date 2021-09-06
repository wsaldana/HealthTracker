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
  int _rating = 0;
  int _sangrados = 0;
  int _calambres = 0;
  int _diarrea = 0;
  int _espalda = 0;
  int _cabeza = 0;

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
                      children: [
                        Text(
                          "Intensidad de sangrados",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Rating((value){
                            _sangrados = value;
                          },
                          (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          }
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Intensidad de calambres",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Rating((value){
                            _calambres = value;
                          },
                          (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          }
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Intensidad de diarrea",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Rating((value){
                            _diarrea = value;
                          },
                          (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          }
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Molestia en espalda baja",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Rating((value){
                            _espalda = value;
                          },
                          (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          }
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Dolor de cabeza",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Rating((value){
                            _cabeza = value;
                          },
                          (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          }
                        ),
                      ],
                    ))

                    // child: Form(
                    //     child: Column(
                    //   children: [
                    //     Rating((rating) {
                    //       setState(() {
                    //         _rating = rating;
                    //       });
                    //     }),
                    //     SizedBox(
                    //         height: 44,
                    //         child: _rating != null && _rating > 0
                    //             ? Text("Su intensidad es de $_rating ",
                    //                 style: TextStyle(fontSize: 18))
                    //             : SizedBox.shrink())
                    //   ],
                    // ))

                    // child: Form(
                    //     child: Column(
                    //   children: [
                    //     ...sintomas.map(sympList2).toList(),
                    //     SizedBox(
                    //       height: 25,
                    //     ),
                    //     SizedBox(
                    //       height: 10,
                    //     ),
                    //   ],
                    // ))
                    ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 700, horizontal: 20),
                    child: Form(
                        child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              ApiController controller = new ApiController();
                              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                              int idUsuario = json.decode(sharedPreferences.getString('userData'))["id_usuario"];
                              bool added = await controller.registrarSintomas(_cabeza, _espalda, _diarrea, _sangrados, _calambres, idUsuario);
                              if(added){
                                Navigator.push(
                                  context, 
                                  new CupertinoPageRoute(
                                    builder: (context) => Home()));
                              }else{
                                print("No se pudo guardar el registro");
                              }
                            },
                            child: Text("Registrar",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
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
        // body: ListView(
        //   children: [
        //     ...sintomas.map(sympList2).toList(),
        //     Container(
        //               width: double.infinity,
        //               padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        //               margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
        //               decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(20),
        //                   color: Theme.of(context).primaryColor,
        //                   boxShadow: [
        //                     BoxShadow(
        //                         color: Theme.of(context).hintColor.withOpacity(0.2),
        //                         offset: Offset(0, 10),
        //                         blurRadius: 20)
        //                   ]),
        //                   )
        //   ],
        //   ),
      );
}
