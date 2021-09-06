import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/sintomas.dart';
import 'infoPaciente.dart';
import '../controllers/apiController.dart';

class SymptomsList extends StatefulWidget {
  final String idPaciente;
  SymptomsList(this.idPaciente);

  @override
  _SymptomsListState createState() => _SymptomsListState();
}

class _SymptomsListState extends State<SymptomsList> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  Future<List<Sintomas>> getSintomasList() async{
    ApiController apiController = new ApiController();
    var listaSintomas = apiController.getSintomasByPaciente(widget.idPaciente);
    return listaSintomas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("HealthTracker"),
            Padding(
              padding: const EdgeInsets.only(bottom:2),
              child: Text("  Médicos",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  fontStyle: FontStyle.italic
                ),
              ),
            ),
          ] 
        )
      ),
      body: Container(
        child: FutureBuilder(
          future: getSintomasList(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.data == null){
              return Container(
                child: Center(child: Text("Loading..."),)
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.lightGreen),
                    title: Text(snapshot.data[index].fecha),
                    subtitle: Text("Normal"),
                    onTap: (){
                      Navigator.push(
                        context, 
                        new CupertinoPageRoute(
                          builder: (context) => InfoPaciente(snapshot.data[index])));
                    },
                  );
                },
              );
            }
          }
        ),
      ),
    );
  }
}
