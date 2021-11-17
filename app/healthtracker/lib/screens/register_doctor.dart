import 'package:flutter/material.dart';
import './doctor.dart';
class Register_doctor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Register_doctorState();
  }
}



class _Register_doctorState extends State<Register_doctor> {
    List<Doctor> doctor = [
    Doctor(nombre: 'Médico no.1'),
    Doctor(nombre: 'Médico no.2'),
    Doctor(nombre: 'Médico no.3'),
  
  ];

  Widget doctor_template(doctor) {  
    
    return Card(

      shadowColor: Colors.black,
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: Container(
        
        margin: const EdgeInsets.all(10),
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(30, 12, 12, 12),
        
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Text(
              doctor.nombre,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
        ],),
      )
      
    );
  
  }

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
                          "Seleccione su médico",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ))),
                Container(
                  
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 25, horizontal: 0),
                    margin: EdgeInsets.symmetric(vertical: 130, horizontal: 20),
                    child: Form(
                        child: Column(
                          
                      children: doctor.map((doctor) => doctor_template(doctor)).toList(),
                    ))),

                    
              ])
            ],
          ),
        ),
      );
 



}
