// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../navdrawer.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  int _selectedIndex = 0;

   void _onItemTapped(int index) {
        setState(() {
          _selectedIndex = index;
          if(_selectedIndex == 0){
            Navigator.pushNamed(context,'dados');
          }else if(_selectedIndex == 1){
            Navigator.pushNamed(context,'personagens');
          }else if(_selectedIndex == 2){
            Navigator.pushNamed(context,'missoes');
          }else if(_selectedIndex == 3){
            Navigator.pushNamed(context,'historias');
          }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          'Menu Principal',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),),
        backgroundColor: Color.fromARGB(255, 102, 51, 6),
      ),

     

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 102, 51, 6),
            icon: Icon(Icons.casino_sharp),
            label: 'Dados',
            tooltip: 'Dados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility),
            label: 'Personagens',
            tooltip: 'Personagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rule),
            label: 'Missões',
            tooltip: 'Missões',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_open),
            label: 'Historias',
            tooltip: 'Historias',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

     body: 
     Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
                Icons.apps,
                size: 120,
                color: Color.fromARGB(255, 140, 41, 8),
              ),
          Card(
            color: Color.fromARGB(141, 194, 186, 48),
            child: ListTile(
                title: Text("Classes"),
                subtitle: Text("Tipos de Classes"),
                onTap:(){
                  Navigator.pushNamed(
                    context,
                    'classes',
                    );
                },
            ),
            
          ), 
          Card(
            color: Color.fromARGB(141, 194, 186, 48),
            child: ListTile(
                title: Text("Condições"),
                subtitle: Text("Condições que o personagem pode estar em batalha ou em situações na historia"),
                onTap:(){
                  Navigator.pushNamed(
                    context,
                    'condicoes',
                    );
                },
            ),
            
          ), 

          Card(
            color: Color.fromARGB(141, 194, 186, 48),
            child: ListTile(
                title: Text("Tipos de danos"),
                subtitle: Text("Cada magia ou armas podem dar varios tipos de danos"),
                onTap:(){
                  Navigator.pushNamed(
                    context,
                    'tiposdedanos',
                    );
                },
            ),
            
          ),
          Card(
            color: Color.fromARGB(141, 194, 186, 48),
            child: ListTile(
                title: Text("Equipamentos"),
                subtitle: Text("Armas e armaduras que os personagens podem ter"),
                onTap:(){
                  Navigator.pushNamed(
                    context,
                    'equipamentos',
                    );
                },
            ),
            
          ),
          Card(
            color: Color.fromARGB(141, 194, 186, 48),
            child: ListTile(
                title: Text("Monstros"),
                subtitle: Text("Inimigos e monstros"),
                onTap:(){
                  Navigator.pushNamed(
                    context,
                    'monstros',
                    );
                },
            ),
            
          ),
          Card(
            color: Color.fromARGB(141, 194, 186, 48),
            child: ListTile(
                title: Text("Raças"),
                subtitle: Text("Raças que possuem no universo de D&D"),
                onTap:(){
                  Navigator.pushNamed(
                    context,
                    'racas',
                    );
                },
            ),
            
          ),
        ],
      ),
      
     );
  }
  
}
