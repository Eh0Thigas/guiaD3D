// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../controller/login_controller.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  var txtTitulo = TextEditingController();
  var txtDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: 'sair',
            onPressed: () {
              LoginController().logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
        ],
      ),

      // BODY
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      'classes',
                    );
                  },
                  label: const Text('Classes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
}
