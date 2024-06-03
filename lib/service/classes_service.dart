import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/classes.dart';



class ClassesService {

  Future<List<Classes>> listarClasses() async {
    var resposta = await http.get(
      Uri.parse(
        'https://www.dnd5eapi.co/api/classes/',
      ),
    );

    if (resposta.statusCode == 200) {
      Iterable lista = json.decode(resposta.body)['results'];
      return lista.map((modelo) => Classes.fromJson(modelo)).toList();
    } else {
      return [];
    }
  }
  

}
