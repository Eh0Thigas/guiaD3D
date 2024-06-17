import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/dano.dart';


class DanoService {

  Future<List<Dano>> listarDanos() async {
    var resposta = await http.get(
      Uri.parse(
        'https://www.dnd5eapi.co/api/damage-types/',
      ),
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['results'];
      return lista.map((modelo) => Dano.fromJson(modelo)).toList();
    } else {
      return [];
    }
  }
  

}
