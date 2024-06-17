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
          }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Menu Principal',),
      ),

     

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.casino_sharp),
            label: 'Dados',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility),
            label: 'Personagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rule),
            label: 'Missões',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),


      body: LayoutBuilder(
      builder: (context, constrains) {
        return Column(
          children: [
            Container(
              width: constrains.maxWidth,
              height: constrains.maxHeight,
              color: Colors.red,
            ),
            Container(
              width: constrains.maxWidth,
              height: constrains.maxHeight ,
              color: Colors.blue,
            ),
            Container(
              width: constrains.maxWidth,
              height: constrains.maxHeight,
              color: Colors.green,
            ),
          ],
        );
      },
    ),
      
      // BODY
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: <Widget>[
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             const SizedBox(width: 5),
    //             FloatingActionButton.extended(
    //               onPressed: () {
    //                 Navigator.pushNamed(
    //                   context,
    //                   'classes',
    //                 );
    //               },
    //               label: const Text('Classes'),
    //             ),
    //           ],
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             const SizedBox(width: 5),
    //             FloatingActionButton.extended(
    //               onPressed: () {
    //                 Navigator.pushNamed(
    //                   context,
    //                   'condicoes',
    //                 );
    //               },
    //               label: const Text('Condiçôes'),
    //             ),
    //           ],
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             const SizedBox(width: 5),
    //             FloatingActionButton.extended(
    //               onPressed: () {
    //                 Navigator.pushNamed(
    //                   context,
    //                   'equipamentos',
    //                 );
    //               },
    //               label: const Text('Equipamentos'),
    //             ),
    //           ],
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             const SizedBox(width: 5),
    //             FloatingActionButton.extended(
    //               onPressed: () {
    //                 Navigator.pushNamed(
    //                   context,
    //                   'monstros',
    //                 );
    //               },
    //               label: const Text('Monstros'),
    //             ),
    //           ],
    //         ),
    //          Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             const SizedBox(width: 5),
    //             FloatingActionButton.extended(
    //               onPressed: () {
    //                 Navigator.pushNamed(
    //                   context,
    //                   'personagens',
    //                 );
    //               },
    //               label: const Text('Personagens'),
    //             ),
    //           ],
    //         ),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             const SizedBox(width: 5),
    //             FloatingActionButton.extended(
    //               onPressed: () {
    //                 Navigator.pushNamed(
    //                   context,
    //                   'missoes',
    //                 );
    //               },
    //               label: const Text('Missões'),
    //             ),
    //           ],
    //         ),
    //          Row(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             const SizedBox(width: 5),
    //             FloatingActionButton.extended(
    //               onPressed: () {
    //                 Navigator.pushNamed(
    //                   context,
    //                   'dados',
    //                 );
    //               },
    //               label: const Text('Tipos de Dados'),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
     );
  }
  
}
