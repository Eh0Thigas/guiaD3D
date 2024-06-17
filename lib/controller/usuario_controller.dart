import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/usuario.dart';
import '../view/util.dart';
import 'login_controller.dart';

class UsuarioController {
 
  adicionar(context, Usuario u) {
    FirebaseFirestore.instance
        .collection('usuarios')
        .add(u.toJson())
        .then((resultado) {
      sucesso(context, 'Usuario adicionado com sucesso!');
    }).catchError((e) {
      erro(context, 'Não foi possível adicionar a tarefa.');
    }).whenComplete(() => Navigator.pop(context));
  }


  listar() {
    return FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: LoginController().idUsuarioLogado());
  }


  atualizar(context, id, Usuario u){

    FirebaseFirestore.instance.collection('usuarios')
      .doc(id)
      .update(u.toJson())
      .then((value) => sucesso(context, 'Usuario atualizado com sucesso!'))
      .catchError((e) => erro(context, 'Não foi possível atualizar o usuario.'))
      .whenComplete(() => Navigator.pop(context));

  }

}
