import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/missao.dart';
import '../view/util.dart';
import 'login_controller.dart';

class MissoesController {
  //Adicionar uma nova tarefa
  adicionar(context, Missao m) {
    FirebaseFirestore.instance
        .collection('missoes')
        .add(m.toJson())
        .then((resultado) {
      sucesso(context, 'Missão adicionada com sucesso!');
    }).catchError((e) {
      erro(context, 'Não foi possível adicionar a Missão.');
    }).whenComplete(() => Navigator.pop(context));
  }

  
  listar() {
    return FirebaseFirestore.instance
        .collection('missoes')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado());
  }

  pesquisar(titulo) {
    return FirebaseFirestore.instance
        .collection('missoes')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado())
        .where('titulo', isEqualTo: titulo);
  }

  
  excluir(context, id) {
    FirebaseFirestore.instance
        .collection('missoes')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Missão excluída com sucesso!'))
        .catchError((e) => erro(context, 'Não foi possível excluir a Missão.'));
  }


  atualizar(context, id, Missao m){

    FirebaseFirestore.instance.collection('missoes')
      .doc(id)
      .update(m.toJson())
      .then((value) => sucesso(context, 'Missão atualizada com sucesso!'))
      .catchError((e) => erro(context, 'Não foi possível atualizar a Missão.'))
      .whenComplete(() => Navigator.pop(context));

  }

}
