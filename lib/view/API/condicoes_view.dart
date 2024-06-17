// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../model/condicoes.dart';
import '../../service/condicoes_service.dart';



class CondicoesView extends StatefulWidget {
  const CondicoesView({super.key});

  @override
  State<CondicoesView> createState() => _CondicoesViewState();
}

class _CondicoesViewState extends State<CondicoesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Condições'),
        actions: [
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        //
        // Requisição da API
        //
        child: FutureBuilder(
          future: CondicoesService().listarCondicoes(),
          builder: (context, snapshot) {
            //Requisição finalizada
            if (snapshot.connectionState == ConnectionState.done) {
              var lista = snapshot.data as List<Condicoes>;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.expand_circle_down),
                      title:
                          Text('${lista[index].name}'),                 
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                      },
                    ),
                  );
                },
              );
            }

            //Aguardando a requisição
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
