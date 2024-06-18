// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/historia_controller.dart';
import '../controller/login_controller.dart';
import '../controller/missoes_controller.dart';
import '../model/historia.dart';
import '../model/missao.dart';



class HistoriaView extends StatefulWidget {
  const HistoriaView({super.key});

  @override
  State<HistoriaView> createState() => _HistoriaViewState();
}

class _HistoriaViewState extends State<HistoriaView> {
  var txtNome = TextEditingController();
  var txtObjetivo = TextEditingController();
  var txtPersonagens = TextEditingController();
  var txtEnredo = TextEditingController();
  var txtLocal = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historias'),
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
          stream: HistoriaController().listar().snapshots(),

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
                          subtitle: Text(doc['local']),

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
                                       txtObjetivo.text = doc['objetivo'];
                                      txtPersonagens.text = doc['personagens'];
                                      txtEnredo.text = doc['enredo'];
                                      txtLocal.text = doc['local'];
                                      salvarHistoria(context, docId: id);
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                ),

                                //
                                // EXCLUIR
                                //
                                IconButton(
                                  onPressed: () {
                                    HistoriaController().excluir(context, id);
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
                    child: Text('Nenhuma Historia encontrada.'),
                  );
                }
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          salvarHistoria(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //
  // ADICIONAR TAREFA
  //
  void salvarHistoria(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text(docId == null ? "Adicionar Historia" : "Editar Historia"),
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
                  controller: txtPersonagens,
                  decoration: InputDecoration(
                    labelText: 'Personagens',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15), 
                TextField(
                  controller: txtEnredo,
                  decoration: InputDecoration(
                    labelText: 'Enredo da Historia',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtLocal,
                  decoration: InputDecoration(
                    labelText: 'Local da Historia',
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
                txtObjetivo.clear();
                txtPersonagens.clear();
                txtEnredo.clear();
                txtLocal.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("salvar"),
              onPressed: () {
                //criar objeto Tarefa
                var t = Historia(
                  LoginController().idUsuarioLogado(),
                  txtNome.text,
                  txtObjetivo.text,
                  txtPersonagens.text,
                  txtEnredo.text,
                  txtLocal.text,
                );

                txtNome.clear();
                txtObjetivo.clear();
                txtPersonagens.clear();             
                txtEnredo.clear();
                txtLocal.clear();

                if (docId == null) {
                  HistoriaController().adicionar(context, t);
                } else {
                  HistoriaController().atualizar(context, docId, t);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
