import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/classes.dart';
import '../model/equipamentos.dart';




class EquipamentosService {

  Future<List<Equipamentos>> listarEquipamentos() async {
    var resposta = await http.get(
      Uri.parse(
        'https://www.dnd5eapi.co/api/equipment/',
      ),
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['results'];
      return lista.map((modelo) => Equipamentos.fromJson(modelo)).toList();
    } else {
      return [];
    }
  }
  

}
