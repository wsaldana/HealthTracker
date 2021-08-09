import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SymptomsState();
  }
}

class _SymptomsState extends State<Symptoms> {

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
                            color: Theme.of(context).hintColor.withOpacity(0.2),
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
                  margin: EdgeInsets.symmetric(vertical: 150, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Form(
                      child: Column(
                        children: [
                          ...sintomas.map(sympList2).toList(),
                          SizedBox(
                            height: 25,
                          ),
  
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ))),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 520, horizontal: 20),
                  
                  child: Form(
                      child: Column(
                        children: [
                          
                          ElevatedButton(
                              onPressed: () {
                                
                              },
                              child: Text("Registrar", 
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                              
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

//lista de sintomas individualmente
  Widget sympList2(ListaSintomas lista) => symplist(
    lista: lista,
    onClicked: () {
      setState(() {
        final newValue = !lista.value;
        lista.value = newValue;
      });
    }
  );

//prueba inicial de sintomas
  Widget symplist({

    ListaSintomas lista, 
    VoidCallback onClicked, 
  }) => ListTile(
    onTap: onClicked,
    leading:Checkbox(
    value: lista.value, 
    onChanged: (value) => onClicked(),
    ),
    
    title: Text(lista.title,
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 22.0,
      fontWeight: FontWeight.w600,
      color: Colors.black)),
  );
}

class ListaSintomas {
  String title;
  bool value;

  ListaSintomas({
    this.title,
    this.value = false,
  });
}
