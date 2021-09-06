import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/paciente.dart';
import 'infoPaciente.dart';
import '../controllers/apiController.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  Future<List<Paciente>> getPacientesList() async{
    ApiController apiController = new ApiController();
    var listaPacientes = apiController.getPacientesByMedico(1);
    /*var listaPacientes = <Paciente>[];
    listaPacientes.add(new Paciente("1", "Luisa Hernandez", "luisa@gmail.com", "+502 1234-5678", "A+", "padecimeintos", "cirugias", "enfermedadesHereditarias", "7 meses", "https://farm4.static.flickr.com/3424/3729244504_07ae21e6a9_o.png"));
    listaPacientes.add(new Paciente("2", "Fiona de Shrek", "fiona@gmail.com", "+502 1234-5678", "B+", "padecimeintos", "cirugias", "enfermedadesHereditarias", "8 meses", "https://img.women.com/images/images/000/027/550/large/Shrek_Fiona_Hero_Image.png.jpg?1470702831"));
    listaPacientes.add(new Paciente("3", "Patricia Estrella", "patricia@gmail.com", "+502 1234-5678", "O-", "padecimeintos", "cirugias", "enfermedadesHereditarias", "8 meses", "https://i.pinimg.com/736x/17/91/b5/1791b5696a8a7dace26ad529d5244c92.jpg"));
    listaPacientes.add(new Paciente("4", "Luisa Hernandez", "luisa@gmail.com", "+502 1234-5678", "A+", "padecimeintos", "cirugias", "enfermedadesHereditarias", "7 meses", "https://farm4.static.flickr.com/3424/3729244504_07ae21e6a9_o.png"));
    listaPacientes.add(new Paciente("5", "Fiona de Shrek", "fiona@gmail.com", "+502 1234-5678", "B+", "padecimeintos", "cirugias", "enfermedadesHereditarias", "8 meses", "https://img.women.com/images/images/000/027/550/large/Shrek_Fiona_Hero_Image.png.jpg?1470702831"));
    listaPacientes.add(new Paciente("6", "Patricia Estrella", "patricia@gmail.com", "+502 1234-5678", "O-", "padecimeintos", "cirugias", "enfermedadesHereditarias", "8 meses", "https://i.pinimg.com/736x/17/91/b5/1791b5696a8a7dace26ad529d5244c92.jpg"));
    listaPacientes.add(new Paciente("7", "Luisa Hernandez", "luisa@gmail.com", "+502 1234-5678", "A+", "padecimeintos", "cirugias", "enfermedadesHereditarias", "7 meses", "https://farm4.static.flickr.com/3424/3729244504_07ae21e6a9_o.png"));
    listaPacientes.add(new Paciente("8", "Fiona de Shrek", "fiona@gmail.com", "+502 1234-5678", "B+", "padecimeintos", "cirugias", "enfermedadesHereditarias", "8 meses", "https://img.women.com/images/images/000/027/550/large/Shrek_Fiona_Hero_Image.png.jpg?1470702831"));
    listaPacientes.add(new Paciente("9", "Patricia Estrella", "patricia@gmail.com", "+502 1234-5678", "O-", "padecimeintos", "cirugias", "enfermedadesHereditarias", "8 meses", "https://i.pinimg.com/736x/17/91/b5/1791b5696a8a7dace26ad529d5244c92.jpg"));
    listaPacientes.add(new Paciente("10", "Luisa Hernandez", "luisa@gmail.com", "+502 1234-5678", "A+", "padecimeintos", "cirugias", "enfermedadesHereditarias", "7 meses", "https://farm4.static.flickr.com/3424/3729244504_07ae21e6a9_o.png"));
    listaPacientes.add(new Paciente("11", "Fiona de Shrek", "fiona@gmail.com", "+502 1234-5678", "B+", "padecimeintos", "cirugias", "enfermedadesHereditarias", "8 meses", "https://img.women.com/images/images/000/027/550/large/Shrek_Fiona_Hero_Image.png.jpg?1470702831"));
    listaPacientes.add(new Paciente("12", "Patricia Estrella", "patricia@gmail.com", "+502 1234-5678", "O-", "padecimeintos", "cirugias", "enfermedadesHereditarias", "8 meses", "https://i.pinimg.com/736x/17/91/b5/1791b5696a8a7dace26ad529d5244c92.jpg"));
    if(listaPacientes.length > 0){
      return listaPacientes;
    }*/
    
    return listaPacientes;
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
          future: getPacientesList(),
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
                    leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data[index].foto),),
                    title: Text(snapshot.data[index].nombre),
                    subtitle: Text(snapshot.data[index].estado),
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
