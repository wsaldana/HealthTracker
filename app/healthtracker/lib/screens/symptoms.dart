import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SymptomsState();
  }
}

class _SymptomsState extends State<Symptoms> {

  TextEditingController emailController = new TextEditingController();

  final sintomas = [
    ListaSintomas(title: 'Sangrados'),
    ListaSintomas(title: 'Calambres'),
    ListaSintomas(title: 'Diarrea'),
    ListaSintomas(title: 'Molestia en espalda baja'),
    ListaSintomas(title: 'Dolor de cabeza'),
  ];

  getCheckboxItems(){
    sintomas.forEach((key, value) {
      if(sintomas == true)
      {
        valuesList.add(key); 
      }
  });

  registrarSintomas(bool dolor_cabeza, bool molestia_espalda_baja, bool diarrea, bool sangrados, bool calambres) async{
    var uri = Uri.parse('https://health-tracker-api-uvg.herokuapp.com/sintomas');
    var jsonData;
    
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id_usuario = json.decode(sharedPreferences.getString('userData')).id_usuario;

    String fecha = DateTime now = new DateTime.now();

    Map<String, String> data = {'dolor_cabeza': dolor_cabeza, 'molestia_espalda_baja': molestia_espalda_baja, 'diarrea':diarrea, 'sangrados':sangrados,  'calambres':calambres, 'fecha':fecha, 'id_usuario':id_usuario};
    
    var response = await http.post(uri, body: data);
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
  );

// Lista de los sintomas de la paciente
  Widget sympList2(ListaSintomas lista) => symplist(
    lista: lista,
    onClicked: () {
      setState(() {
        final newValue = !lista.value;
        lista.value = newValue;
      });
    }
  );

// Prueba 
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











