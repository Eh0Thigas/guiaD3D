// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/dados_controller.dart';
import '../controller/login_controller.dart';
import '../model/dado.dart';



class DadosView extends StatefulWidget {
  const DadosView({super.key});

  @override
  State<DadosView> createState() => _DadosViewState();
}

class _DadosViewState extends State<DadosView> {
  var txtNome = TextEditingController();
  var txtValor = TextEditingController();
  var txtObjetivo = TextEditingController();
  var txtUltilizadores = TextEditingController();
  var txtCritico = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados'),
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
          stream: DadosController().listar().snapshots(),

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
                          subtitle: Text(doc['valor']),

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
                                      txtValor.text = doc['valor'];
                                      txtObjetivo.text = doc['objetivo'];
                                      txtUltilizadores.text = doc['ultilizadores'];
                                      txtCritico.text = doc['critico'];
                                      salvarDado(context, docId: id);
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                ),

                                //
                                // EXCLUIR
                                //
                                IconButton(
                                  onPressed: () {
                                    DadosController().excluir(context, id);
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
                    child: Text('Nenhuma Dado encontrada.'),
                  );
                }
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          salvarDado(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //
  // ADICIONAR TAREFA
  //
  void salvarDado(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text(docId == null ? "Adicionar Dado" : "Editar Dado"),
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
                  controller: txtValor,
                  decoration: InputDecoration(
                    labelText: 'Valor',
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
                  controller: txtUltilizadores,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Ultilizadores',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtCritico,
                  decoration: InputDecoration(
                    labelText: 'Valores Críticos',
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
                txtValor.clear();
                txtObjetivo.clear();
                txtUltilizadores.clear();
                txtCritico.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("salvar"),
              onPressed: () {
                //criar objeto Tarefa
                var t = Dado(
                  LoginController().idUsuarioLogado(),
                  txtNome.text,
                  txtValor.text,
                  txtObjetivo.text,
                  txtUltilizadores.text,
                  txtCritico.text,
                );

                txtNome.clear();
                txtValor.clear();
                txtObjetivo.clear();
                txtUltilizadores.clear();
                txtCritico.clear();

                if (docId == null) {
                  DadosController().adicionar(context, t);
                } else {
                  DadosController().atualizar(context, docId, t);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
