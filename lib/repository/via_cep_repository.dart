import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:app_consula_cep/model/via_cep_model.dart';

class ViaCepRepository {
  Future<ViaCepModel> consultarCEP(String cep) async {
    var response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if(response.statusCode == HttpStatus.ok) {
      var json = jsonDecode(response.body);
      return ViaCepModel.fromJson(json);
    }
    return ViaCepModel();
  }
}
