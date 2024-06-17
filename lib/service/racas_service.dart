import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/racas.dart';

class RacasService {

  Future<List<Raca>> listarRacas() async {
    var resposta = await http.get(
      Uri.parse(
        'https://www.dnd5eapi.co/api/races/',
      ),
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['results'];
      return lista.map((modelo) => Raca.fromJson(modelo)).toList();
    } else {
      return [];
    }
  }
  

}
