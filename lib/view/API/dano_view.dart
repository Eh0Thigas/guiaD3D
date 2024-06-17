// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


import '../../model/racas.dart';

import '../../service/racas_service.dart';




class DanoView extends StatefulWidget {
  const DanoView({super.key});

  @override
  State<DanoView> createState() => _DanoViewState();
}

class _DanoViewState extends State<DanoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de Dano'),
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
                      leading: Icon(Icons.group),
                      title:
                          Text('${lista[index].name}'),                 
                      trailing: Icon(Icons.favorite),
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
