import 'package:flutter/material.dart';
import './doctor.dart';
class Register_doctor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Register_doctorState();
  }
}

List<Doctor> doctor = [
  Doctor(nombre: 'Médico no.1'),
  Doctor(nombre: 'Médico no.2'),
  Doctor(nombre: 'Médico no.3'),
];


class _Register_doctorState extends State<Register_doctor> {
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
                          "Seleccioné a su médico",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ))),

              ])
            ],
          ),
        ),
      );
}
