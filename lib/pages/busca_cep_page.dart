import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/via_cep_model.dart';

class BuscaCepPage extends StatefulWidget {
  @override
  _BuscaCepPageState createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  var cepController = TextEditingController(text: '');
  bool loading = false;
  var viaCepModel = ViaCepModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                'Consulta de CEP',
                style: TextStyle(fontSize: 18),
              ),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 8,
                controller: cepController,
                onChanged: (String val) async {
                  setState(() {
                    loading = true;
                  });
                  var cep = val.replaceAll(RegExp('r[^0-9]'), '');
                  if (cep.trim().length == 8) {
                    var response = await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
                    var json = jsonDecode(response.body);
                    viaCepModel = ViaCepModel.fromJson(json);
                  }

                  setState(() {
                    loading = false;
                  });
                },
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                viaCepModel.logradouro ?? '',
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                '${viaCepModel.localidade ?? ''} ${viaCepModel.localidade != null ? '-' : ''} ${viaCepModel.uf ?? ''}',
                style: const TextStyle(fontSize: 22),
              ),
              Visibility(visible: loading, child: const CircularProgressIndicator())
            ],
          ),
        ),
      ),
    );
  }
}
