import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import '../model/historia.dart';
import '../view/util.dart';
import 'login_controller.dart';

class HistoriaController {
  adicionar(context, Historia h) {
    FirebaseFirestore.instance
        .collection('historia')
        .add(h.toJson())
        .then((resultado) {
      sucesso(context, 'Historia adicionado com sucesso!');
    }).catchError((e) {
      erro(context, 'Não foi possível adicionar a Historia.');
    }).whenComplete(() => Navigator.pop(context));
  }

  
  listar() {
    return FirebaseFirestore.instance
        .collection('historia')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado());
  }

  pesquisar(titulo) {
    return FirebaseFirestore.instance
        .collection('historia')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado())
        .where('titulo', isEqualTo: titulo);
  }

  
  excluir(context, id) {
    FirebaseFirestore.instance
        .collection('historia')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Historia excluída com sucesso!'))
        .catchError((e) => erro(context, 'Não foi possível excluir a Historia.'));
  }


  atualizar(context, id, Historia h){

    FirebaseFirestore.instance.collection('historia')
      .doc(id)
      .update(h.toJson())
      .then((value) => sucesso(context, 'Historia atualizado com sucesso!'))
      .catchError((e) => erro(context, 'Não foi possível atualizar a Historia.'))
      .whenComplete(() => Navigator.pop(context));

  }

}
