import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../view/util.dart';

class LoginController{

  criarConta(context,nome,email,senha){
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: senha).then((resultado){
    

      //ARMAZENAR O NOME E UID DO USUARIO NO FIRESTORE

      FirebaseFirestore.instance.collection("usuarios").add(
        {
          "uid": resultado.user!.uid,
          "nome": nome,
        }
      );

      //usuario criado com sucesso
      sucesso(context, 'Usuario criado EBAAAA!');
      Navigator.pop(context);
    }).catchError((e){
      //erro durante o cadastro
      switch (e.code){
        case 'email-already-in-use':
          erro(context, 'Email ja criado, tente outro');
          break;
        case 'invalid-email':
          erro(context, 'Digitou o email em formato errado');
          break;
        default:
          erro(context, 'ERRO: ${e.toString()}');
      }
    });
  }

  //
  //Login de usuario apartir do provedor email/senha
  //

  login(context,email,senha){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha).then((resultado){

       sucesso(context, 'Usuario autentificado EBAAAA!' );
       Navigator.pushNamed(context, 'principal');

    }).catchError((e){
      switch(e.code){
        case 'invalid-email':
        erro(context, 'Email errado seu burro');
        case 'invalid-credential':
        erro(context, 'Credenciais invalidas');
        case 'wrong-password':
        erro(context, 'Senha incorreta');
        default:
        erro(context, 'Erro: ${e.code.toString()}');
      }
    });
  }

  esqueceuSenha(context,email){ 
    if(email.isNotEmpty){
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      sucesso(context, 'Email enviado');
    } else {
      erro(context, 'Informe o email caralho');
    }  
  }

  logout(){

    FirebaseAuth.instance.signOut();

  }

  idUsuarioLogado(){
    return FirebaseAuth.instance.currentUser!.uid;   
  }

}















 