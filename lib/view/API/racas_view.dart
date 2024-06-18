// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


import '../../model/racas.dart';
import '../../service/racas_service.dart';


class RacasView extends StatefulWidget {
  const RacasView({super.key});

  @override
  State<RacasView> createState() => _RacasViewState();
}

class _RacasViewState extends State<RacasView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raças'),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: FutureBuilder(
          future: RacasService().listarRacas(),
          builder: (context, snapshot) {
            //Requisição finalizada
            if (snapshot.connectionState == ConnectionState.done) {
              var lista = snapshot.data as List<Raca>;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.sentiment_dissatisfied),
                      title:
                          Text('${lista[index].name}'),                 
                      trailing: Icon(Icons.diversity_3),
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
