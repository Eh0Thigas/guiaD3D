import 'dart:convert';

import 'package:http/http.dart' as http;

import '/model/monstros.dart';

class MonstrosService {

  Future<List<Monstros>> listarMonstros() async {
    var resposta = await http.get(
      Uri.parse(
        'https://www.dnd5eapi.co/api/monsters/',
      ),
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['results'];
      return lista.map((modelo) => Monstros.fromJson(modelo)).toList();
    } else {
      return [];
    }
  }
  

}
