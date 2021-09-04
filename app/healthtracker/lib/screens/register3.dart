import 'package:flutter/material.dart';

class Register3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Register3State();
  }
}

class _Register3State extends State<Register3> {
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
                          "Historial de síntomas",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ))),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
                    margin: EdgeInsets.symmetric(vertical: 150, horizontal: 20),
                    child: Form(
                        child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Síntomas mm/dd/yyyy",
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
                                    vertical: 15, horizontal: 75))),
                        SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text("Síntomas mm/dd/yyyy",
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
                                    vertical: 15, horizontal: 75))),
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
