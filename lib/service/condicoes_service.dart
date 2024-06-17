import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/condicoes.dart';



class CondicoesService {

  Future<List<Condicoes>> listarCondicoes() async {
    var resposta = await http.get(
      Uri.parse(
        'https://www.dnd5eapi.co/api/conditions/',
      ),
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['results'];
      return lista.map((modelo) => Condicoes.fromJson(modelo)).toList();
    } else {
      return [];
    }
  }
  

}
