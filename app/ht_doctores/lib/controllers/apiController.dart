import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/paciente.dart';
import '../models/sintomas.dart';

class ApiController {

  String apiUrl = 'https://health-tracker-api-uvg.herokuapp.com';
  
  Future<List<Paciente>> getPacientesByMedico(int idMedico) async{
    
    var uri = Uri.parse(apiUrl+'/usuariosByMedico/'+idMedico.toString());
    var jsonData;
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      var listaPacientes = <Paciente>[];
      for (var item in jsonData) {
        Paciente paciente = new Paciente(
          item["id_usuario"].toString(),
          item["nombre"], 
          item["correo"], 
          item["telefono"], 
          item["tipo_de_sangre"], 
          item["padecimientos"], 
          item["cirugias"], 
          item["enfermedades_hereditarias"], 
          item["estado"], 
          item["foto"]
        );
        listaPacientes.add(paciente);
      }
      return listaPacientes;
    } else {
      print("--- No se ha podido realizar la consulta con el API");
      return null;
    }

  }

  Future<List<Sintomas>> getSintomasByPaciente(String idPaciente) async {
    var uri = Uri.parse(apiUrl+'/listaSintomas/'+idPaciente);
    var jsonData;
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      var listaSintomas = <Sintomas>[];
      for (var item in jsonData) {
        print(item);
        Sintomas sintomas = new Sintomas(
          item["id_sintoma"], 
          item["id_usuario"], 
          item["fecha"], 
          item["dolor_cabeza"], 
          item["molestia_espalda_baja"], 
          item["diarrea"], 
          item["sangrados"], 
          item["calambres"]
        );
        listaSintomas.add(sintomas);
        print(sintomas);
      }
      return listaSintomas;
    } else {
      print("--- No se ha podido realizar la consulta con el API");
      return null;
    }
  }
}