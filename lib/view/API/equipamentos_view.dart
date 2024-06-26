// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../model/equipamentos.dart';
import '../../service/equipamentos_service.dart';






class EquipamentosView extends StatefulWidget {
  const EquipamentosView({super.key});

  @override
  State<EquipamentosView> createState() => _EquipamentosViewState();
}

class _EquipamentosViewState extends State<EquipamentosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamentos'),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: FutureBuilder(
          future: EquipamentosService().listarEquipamentos(),
          builder: (context, snapshot) {
            //Requisição finalizada
            if (snapshot.connectionState == ConnectionState.done) {
              var lista = snapshot.data as List<Equipamentos>;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.construction),
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
