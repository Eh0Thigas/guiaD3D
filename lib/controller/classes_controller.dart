import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/classes.dart';
import '../view/util.dart';
import 'login_controller.dart';

class ClasseController {
 

  //Listar todas as tarefas do usuário logado
  listar() {
    return FirebaseFirestore.instance
        .collection('tarefas')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado());
  }

  pesquisar(titulo) {
    return FirebaseFirestore.instance
        .collection('tarefas')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado())
        .where('titulo', isEqualTo: titulo);
  }

}
