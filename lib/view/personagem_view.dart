// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/login_controller.dart';
import '../controller/personagens_controller.dart';
import '../model/personagem.dart';


class PersonagemView extends StatefulWidget {
  const PersonagemView({super.key});

  @override
  State<PersonagemView> createState() => _PersonagemViewState();
}

class _PersonagemViewState extends State<PersonagemView> {
  var txtNome = TextEditingController();
  var txtRaca = TextEditingController();
  var txtClasse = TextEditingController();
  var txtEquipamento = TextEditingController();
  var txtFeitico = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personagens'),
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
          stream: PersonagensController().listar().snapshots(),

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
                          subtitle: Text(doc['classe']),

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
                                      txtRaca.text = doc['raca'];
                                      txtClasse.text = doc['classe'];
                                      txtEquipamento.text = doc['equipamento'];
                                      txtFeitico.text = doc['feitico'];
                                      salvarPersonagem(context, docId: id);
                                    },
                                    icon: Icon(Icons.edit_outlined),
                                  ),
                                ),

                                //
                                // EXCLUIR
                                //
                                IconButton(
                                  onPressed: () {
                                    PersonagensController().excluir(context, id);
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
                    child: Text('Nenhuma Personagem encontrada.'),
                  );
                }
            }
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          salvarPersonagem(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //
  // ADICIONAR TAREFA
  //
  void salvarPersonagem(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: Text(docId == null ? "Adicionar Personagem" : "Editar Personagem"),
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
                  controller: txtRaca,
                  decoration: InputDecoration(
                    labelText: 'Raça',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtClasse,
                  decoration: InputDecoration(
                    labelText: 'Classe',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtEquipamento,
                  decoration: InputDecoration(
                    labelText: 'Equipamento',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: txtFeitico,
                  decoration: InputDecoration(
                    labelText: 'Feitiços',
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
                txtRaca.clear();
                txtClasse.clear();
                txtEquipamento.clear();
                txtFeitico.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("salvar"),
              onPressed: () {
                //criar objeto Tarefa
                var t = Personagem(
                  LoginController().idUsuarioLogado(),
                  txtNome.text,
                  txtRaca.text,
                  txtClasse.text,
                  txtEquipamento.text,
                  txtFeitico.text,
                );

                txtNome.clear();
                txtRaca.clear();
                txtClasse.clear();
                txtEquipamento.clear();
                txtFeitico.clear();

                if (docId == null) {
                  PersonagensController().adicionar(context, t);
                } else {
                  PersonagensController().atualizar(context, docId, t);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
