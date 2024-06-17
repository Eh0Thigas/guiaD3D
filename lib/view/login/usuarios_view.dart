// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../controller/login_controller.dart';
import '../../controller/usuario_controller.dart';
import '../../model/usuario.dart';

class UsuariosView extends StatefulWidget {
  const UsuariosView({super.key});

  @override
  State<UsuariosView> createState() => _UsuariosViewState();
}

class _UsuariosViewState extends State<UsuariosView> {
  var txtNome = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCpf = TextEditingController();
  var txtNickname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            tooltip: 'sair',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      // BODY
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder<QuerySnapshot>(
          //fluxo de dados em tempo real
          stream: UsuarioController().listar().snapshots(),

          //exibição dos dados
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //sem conexão
              case ConnectionState.none:
                return Center(
                  child: Text('Não foi possível conectar.'),
                );

              //aguardando a execução da consulta
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );

              //Ufa, deu certo!
              default:
                final dados = snapshot.requireData;
                if (dados.size > 0) {
                  return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      String id = dados.docs[index].id;
                      dynamic doc = dados.docs[index].data();
                      return Card(
                        child: ListTile(
                          title: Text(doc['nome']),
                          subtitle: Text(doc['nickname']),

                          //excluir
                          trailing: SizedBox(
                            width: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  //
                                  // ATUALIZAR
                                  //
                                  child: IconButton(
                                    onPressed: () {
                                      txtNome.text = doc['nome'];
                                      txtTelefone.text = doc['telefone'];
                                      txtCpf.text = doc['cpf'];
                                      txtNickname.text = doc['nickname'];
                                      salvarUsuario(context, docId: id);
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('Nenhum usuario encontrado.'),
                  );
                }
            }
          },
        ),
      ),
    );
  }

  //
  // ADICIONAR TAREFA
  //
  void salvarUsuario(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text(docId == null ? "Adicionar Usuario" : "Editar Usuario"),
          content: SizedBox(
            height: 400,
            width: 500,
            child: Column(
              children: [
                TextField(
                  controller: txtNome,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtTelefone,
             
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtCpf,
                
                  decoration: InputDecoration(
                    labelText: 'Cpf',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtNickname,
                  
                  decoration: InputDecoration(
                    labelText: 'Nickname',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          actions: [
            TextButton(
              child: Text("fechar"),
              onPressed: () {
                txtNome.clear();
                txtTelefone.clear();
                txtCpf.clear();
                txtNickname.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("salvar"),
              onPressed: () {
                //criar objeto Tarefa
                var t = Usuario(
                  LoginController().idUsuarioLogado(),
                  txtNome.text,
                  txtTelefone.text,
                  txtCpf.text,
                  txtNickname.text
                );

                txtNome.clear();
                txtTelefone.clear();
                txtCpf.clear();
                txtNickname.clear();

                UsuarioController().atualizar(context, docId, t);
                
              },
            ),
          ],
        );
      },
    );
  }
}
