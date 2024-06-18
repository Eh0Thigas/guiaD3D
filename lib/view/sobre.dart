import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}

class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra de Título
      appBar: AppBar(
        title: Text(
          'Sobre',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 102, 51, 6),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.white,
            tooltip: 'sair',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),

      //Corpo
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
                Icons.account_circle,
                size: 120,
                color: Color.fromARGB(255, 140, 41, 8),
              ),
          Card(
            color: Color.fromARGB(141, 194, 186, 48),
            child: ListTile(
                title: Text("Desenvolvedor"),
                subtitle: Text("Thiago Laurenti Coelho - 834560"),
            )
          ), 

          Card(
            color: Color.fromARGB(141, 194, 186, 48),
            child: ListTile(
                title: Text("Tema"),
                subtitle: Text("Guia de D&D"),
            )
          ), 

          Card(
            color: Color.fromARGB(141, 194, 186, 48),
            child: ListTile(
                title: Text("Objetivo"),
                subtitle: Text("Criar um guia simples de RPG utilizando APIs e o Firebase"),
            )
          )
        ],
      ),
    );
  }
}