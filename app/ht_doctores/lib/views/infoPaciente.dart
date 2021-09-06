import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/paciente.dart';
import './symptomsList.dart';

class InfoPaciente extends StatelessWidget {
  final Paciente paciente;
  InfoPaciente(this.paciente);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(paciente.nombre)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.black26, spreadRadius: 5)
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(paciente.foto),
                  radius: 50,
                ),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: TextButton.icon(
                      onPressed: () {
                        print("Llamando");
                      },
                      label: Text(paciente.telefono),
                      icon: Icon(Icons.call))),
              Center(
                  child: TextButton.icon(
                      onPressed: () {
                        print("Enviando email");
                      },
                      label: Text(paciente.correo),
                      icon: Icon(Icons.email))),
              Divider(
                color: Colors.black38,
                height: 40,
                thickness: 1,
                indent: 0,
                endIndent: 0,
              ),
              Text(
                "Estado:",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                paciente.estado,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Tipo de sangre:",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                paciente.tipoDeSangre,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Padecimientos:",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                paciente.padecimientos,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Cirugías:",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                paciente.cirugias,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Enfermedades hereditarias:",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                paciente.enfermedadesHereditarias,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new CupertinoPageRoute(
                              builder: (context) =>
                                  SymptomsList('1'))); //paciente.idUsuario
                    },
                    child: Text("Análisis"),
                    style: ElevatedButton.styleFrom(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 50))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
