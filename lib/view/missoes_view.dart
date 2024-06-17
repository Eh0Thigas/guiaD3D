// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/login_controller.dart';
import '../controller/missoes_controller.dart';
import '../controller/personagens_controller.dart';
import '../model/missao.dart';
import '../model/personagem.dart';


class MissoesView extends StatefulWidget {
  const MissoesView({super.key});

  @override
  State<MissoesView> createState() => _MissoesViewState();
}

class _MissoesViewState extends State<MissoesView> {
  var txtNome = TextEditingController();
  var txtCategoria = TextEditingController();
  var txtObjetivo = TextEditingController();
  var txtIntegrantes = TextEditingController();
  var txtRecompensa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Missões'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: 'sair',
            onPressed: () {
              LoginController().logout();
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
          stream: MissoesController().listar().snapshots(),

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
                          subtitle: Text(doc['recompensa']),

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
                                      txtCategoria.text = doc['categoria'];
                                      txtObjetivo.text = doc['objetivo'];
                                      txtIntegrantes.text = doc['integrantes'];
                                      txtRecompensa.text = doc['recompensa'];
                                      salvarMissao(context, docId: id);
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                ),

                                //
                                // EXCLUIR
                                //
                                IconButton(
                                  onPressed: () {
                                    MissoesController().excluir(context, id);
                                  },
                                  icon: Icon(Icons.delete_outlined),
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
                    child: Text('Nenhuma Missão encontrada.'),
                  );
                }
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          salvarMissao(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //
  // ADICIONAR TAREFA
  //
  void salvarMissao(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text(docId == null ? "Adicionar Missão" : "Editar Missão"),
          content: SizedBox(
            height: 450,
            width: 300,
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
                  controller: txtCategoria,
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtObjetivo,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Objetivo',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtIntegrantes,
                  decoration: InputDecoration(
                    labelText: 'Integrantes',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtRecompensa,
                  decoration: InputDecoration(
                    labelText: 'Recompensa',
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
                txtCategoria.clear();
                txtObjetivo.clear();
                txtIntegrantes.clear();
                txtRecompensa.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("salvar"),
              onPressed: () {
                //criar objeto Tarefa
                var t = Missao(
                  LoginController().idUsuarioLogado(),
                  txtNome.text,
                  txtCategoria.text,
                  txtObjetivo.text,
                  txtIntegrantes.text,
                  txtRecompensa.text,
                );

                txtNome.clear();
                txtCategoria.clear();
                txtObjetivo.clear();
                txtIntegrantes.clear();
                txtRecompensa.clear();

                if (docId == null) {
                  MissoesController().adicionar(context, t);
                } else {
                  MissoesController().atualizar(context, docId, t);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
