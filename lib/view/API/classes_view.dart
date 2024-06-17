// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../model/classes.dart';
import '../../service/classes_service.dart';




class ClassesView extends StatefulWidget {
  const ClassesView({super.key});

  @override
  State<ClassesView> createState() => _ClassesViewState();
}

class _ClassesViewState extends State<ClassesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
        actions: [],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),

        child: FutureBuilder(
          future: ClassesService().listarClasses(),
          builder: (context, snapshot) {
            //Requisição finalizada
            if (snapshot.connectionState == ConnectionState.done) {
              var lista = snapshot.data as List<Classes>;
              return ListView.builder(
                itemCount: lista.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.group),
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
