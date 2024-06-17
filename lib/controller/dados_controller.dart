import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/dado.dart';
import '../view/util.dart';
import 'login_controller.dart';

class DadosController {
  adicionar(context, Dado d) {
    FirebaseFirestore.instance
        .collection('dados')
        .add(d.toJson())
        .then((resultado) {
      sucesso(context, 'Dado adicionado com sucesso!');
    }).catchError((e) {
      erro(context, 'Não foi possível adicionar o Dado.');
    }).whenComplete(() => Navigator.pop(context));
  }

  
  listar() {
    return FirebaseFirestore.instance
        .collection('dados')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado());
  }

  pesquisar(titulo) {
    return FirebaseFirestore.instance
        .collection('dados')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado())
        .where('titulo', isEqualTo: titulo);
  }

  
  excluir(context, id) {
    FirebaseFirestore.instance
        .collection('dados')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Dado excluído com sucesso!'))
        .catchError((e) => erro(context, 'Não foi possível excluir o Dado.'));
  }


  atualizar(context, id, Dado d){

    FirebaseFirestore.instance.collection('dados')
      .doc(id)
      .update(d.toJson())
      .then((value) => sucesso(context, 'Dado atualizado com sucesso!'))
      .catchError((e) => erro(context, 'Não foi possível atualizar a Dado.'))
      .whenComplete(() => Navigator.pop(context));

  }

}
