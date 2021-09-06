import 'package:flutter/material.dart';
import 'package:ht_doctores/views/rating.dart';
import '../models/sintomas.dart';

class SymptomsForm extends StatelessWidget {
  final Sintomas sintomas;
  SymptomsForm(this.sintomas);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        sintomas.fecha,
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
                      Rating(sintomas.sangrados),
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
                      Rating(sintomas.calambres),
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
                      Rating(sintomas.diarrea),
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
                      Rating(sintomas.molestiaEspaldaBaja),
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
                      Rating(sintomas.dolorCabeza),
                    ],
                  ))
                  ),
            ])
          ],
        ),
      ),

    );
  }
}
