import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/paciente.dart';

class ApiController {
  
  Future<List<Paciente>> getPacientesByMedico(int idMedico) async{
    
    var uri = Uri.parse('https://health-tracker-api-uvg.herokuapp.com/usuariosByMedico/'+idMedico.toString());
    var jsonData;
    print("Simon");
    final response = await http.get(uri);
    print('nel');
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      print(jsonData);
      var listaPacientes = <Paciente>[];
      for (var item in jsonData) {
        listaPacientes.add(new Paciente(
          item["nombre"], 
          item["correo"], 
          item["telefono"], 
          item["tipo_de_sangre"], 
          item["padecimientos"], 
          item["cirugias"], 
          item["enfermedades_hereditarias"], 
          item["estado"], 
          item["foto"]
        ));
      }
      return listaPacientes;
    } else {
      print("--- No se ha podido realizar la consulta con el API");
      return null;
    }

  }
}