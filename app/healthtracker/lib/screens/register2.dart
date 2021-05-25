import 'package:flutter/material.dart';
import 'package:healthtracker/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register2 extends StatefulWidget {
  @override
  _Register2State createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController sangreController = new TextEditingController();
  TextEditingController padecimientosController = new TextEditingController();
  TextEditingController cirugiasController = new TextEditingController();
  TextEditingController enfermedadesHereditariasController =
      new TextEditingController();

  registerApi(String sangre, String padecimientos, String cirugias, String enfermedades) async {
    var uri = Uri.parse('https://83ef0fc67729.ngrok.io/historial');
    var jsonData;

    Map<String, String> data = {
      'tipo_de_sangre': sangre,
      'padecimientos': padecimientos,
      'cirugias': cirugias,
      'enfermedades_hereditarias': enfermedades
    };

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(uri, body: data);

    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(jsonData['statusCode']);
      if (jsonData['statusCode'] == 200) {
        print(jsonData);
        setState(() {
          isLoading = false;
          sharedPreferences.setString("userMedicalHistory", jsonData['body'].toString());
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => Home()),
              (Route<dynamic> route) => false);
        });
      } else {
        print("--- No se ha podido registrar el historial");
      }
    } else {
      print("--- No se ha podido realizar la consulta con el API");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
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
                      key: globalFormKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0,
                          ),
                          Text(
                            "Health Tracker",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          new TextFormField(
                              controller: sangreController,
                              decoration: new InputDecoration(
                                  hintText: "Tipo de Sangre",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).accentColor)),
                                  prefixIcon: Icon(Icons.add_circle_outline,
                                      color: Theme.of(context).accentColor))),
                          new TextFormField(
                              controller: padecimientosController,
                              decoration: new InputDecoration(
                                  hintText: "Padecimientos",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).accentColor)),
                                  prefixIcon: Icon(Icons.local_hotel,
                                      color: Theme.of(context).accentColor))),
                          SizedBox(
                            height: 0,
                          ),
                          new TextFormField(
                              controller: cirugiasController,
                              decoration: new InputDecoration(
                                  hintText: "Cirugias",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).accentColor)),
                                  prefixIcon: Icon(Icons.location_city,
                                      color: Theme.of(context).accentColor))),
                          new TextFormField(
                              controller: enfermedadesHereditariasController,
                              decoration: new InputDecoration(
                                  hintText: "Enfermedades Hereditarias",
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .accentColor
                                              .withOpacity(0.2))),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).accentColor)),
                                  prefixIcon: Icon(Icons.person_add_alt_1,
                                      color: Theme.of(context).accentColor))),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                });
                                registerApi(
                                  sangreController.text,
                                  padecimientosController.text,
                                  cirugiasController.text,
                                  enfermedadesHereditariasController.text,
                                );
                              },
                              child: Text("Ingresar historial medico"),
                              style: ElevatedButton.styleFrom(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 100))),
                        ],
                      ))),
            ])
          ],
        ),
      ),
    );
  }
}
