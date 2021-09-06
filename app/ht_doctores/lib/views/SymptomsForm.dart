import 'package:flutter/material.dart';
import 'package:ht_doctores/views/rating.dart';
import '../models/sintomas.dart';

class Symptoms extends StatefulWidget {
  final Sintomas sintoma;
  Symptoms(this.sintoma);
  @override
  State<StatefulWidget> createState() {
    return _SymptomsState();
  }
}

class ListaSintomas {
  String title;
  bool value;

  ListaSintomas({
    this.title,
    this.value = false,
  });
}

class _SymptomsState extends State<Symptoms> {
  int valor;
  int rating;
  final sintomas = [
    ListaSintomas(title: 'Sangrados'),
    ListaSintomas(title: 'Calambres'),
    ListaSintomas(title: 'Diarrea'),
    ListaSintomas(title: 'Molestia en espalda baja'),
    ListaSintomas(title: 'Dolor de cabeza'),
  ];

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
                          "Lectura de síntomas",
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
                        Rating((valor), (rating) {
                          setState(() {
                            valor = widget.sintoma.sangrados;
                            rating = valor;
                          });
                        }),
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
                        Rating((valor), (rating) {
                          setState(() {
                            valor = widget.sintoma.calambres;
                            rating = valor;
                          });
                        }),
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
                        Rating((valor), (rating) {
                          setState(() {
                            valor = widget.sintoma.diarrea;
                            rating = valor;
                          });
                        }),
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
                        Rating((valor), (rating) {
                          setState(() {
                            valor = widget.sintoma.molestiaEspaldaBaja;
                            rating = valor;
                          });
                        }),
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
                        Rating((valor), (rating) {
                          setState(() {
                            valor = widget.sintoma.dolorCabeza;
                            rating = valor;
                          });
                        }),
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
                            onPressed: () {},
                            child: Text("Analizar",
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

// //lista de sintomas individualmente
  Widget sympList2(ListaSintomas lista) => symplist(
        lista: lista,
      );

//prueba inicial de sintomas
  Widget symplist({
    ListaSintomas lista,
  }) =>
      ListTile(
        title: Text(lista.title,
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      );
}
