import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiController {

  String apiUrl = 'https://health-tracker-api-uvg.herokuapp.com';

  Future<bool> registrarSintomas(int dolorCabeza, int molestiaEspaldaBaja, int diarrea, int sangrados, int calambres, int idUsuario) async {
    var uri = Uri.parse(apiUrl+'/sintomas');
    var jsonData;
    Map data = {
      'dolor_cabeza': dolorCabeza, 
      'molestia_espalda_baja': molestiaEspaldaBaja, 
      'diarrea': diarrea, 
      'sangrados': sangrados, 
      'calambres': calambres, 
      'idUsuario': idUsuario, 
      'fecha': DateTime.now().toString
    };
    final response = await http.post(uri, body: data);

    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      if (jsonData['statusCode'] == 200) {
        return true;
      } else {
        print("--- No se han podido registrar los sintomas");
      }
    } else {
      print("--- No se ha podido realizar la consulta con el API");
    }
    return false;
  }
}