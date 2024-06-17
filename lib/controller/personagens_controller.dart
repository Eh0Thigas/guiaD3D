import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/personagem.dart';
import '../view/util.dart';
import 'login_controller.dart';

class PersonagensController {
  //Adicionar uma nova tarefa
  adicionar(context, Personagem p) {
    FirebaseFirestore.instance
        .collection('personagens')
        .add(p.toJson())
        .then((resultado) {
      sucesso(context, 'Personagem adicionada com sucesso!');
    }).catchError((e) {
      erro(context, 'Não foi possível adicionar a Personagem.');
    }).whenComplete(() => Navigator.pop(context));
  }

  
  listar() {
    return FirebaseFirestore.instance
        .collection('personagens')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado());
  }

  pesquisar(titulo) {
    return FirebaseFirestore.instance
        .collection('personagens')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado())
        .where('titulo', isEqualTo: titulo);
  }

  
  excluir(context, id) {
    FirebaseFirestore.instance
        .collection('personagens')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Personagem excluída com sucesso!'))
        .catchError((e) => erro(context, 'Não foi possível excluir a Personagem.'));
  }


  atualizar(context, id, Personagem p){

    FirebaseFirestore.instance.collection('personagens')
      .doc(id)
      .update(p.toJson())
      .then((value) => sucesso(context, 'Personagem atualizada com sucesso!'))
      .catchError((e) => erro(context, 'Não foi possível atualizar a Personagem.'))
      .whenComplete(() => Navigator.pop(context));

  }

}
