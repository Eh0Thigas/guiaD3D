// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../model/monstros.dart';
import '../../service/Monstros_service.dart';


class MonstrosView extends StatefulWidget {
  const MonstrosView({super.key});

  @override
  State<MonstrosView> createState() => _MonstrosViewState();
}

class _MonstrosViewState extends State<MonstrosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monstros'),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: FutureBuilder(
          future: MonstrosService().listarMonstros(),
          builder: (context, snapshot) {
            //Requisição finalizada
            if (snapshot.connectionState == ConnectionState.done) {
              var lista = snapshot.data as List<Monstros>;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.sentiment_dissatisfied),
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
