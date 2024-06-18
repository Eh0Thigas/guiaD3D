// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../controller/login_controller.dart';

class CadastrarLoginView extends StatefulWidget {
  const CadastrarLoginView({super.key});

  @override
  State<CadastrarLoginView> createState() => _CadastrarLoginViewState();
}

class _CadastrarLoginViewState extends State<CadastrarLoginView> {
  var txtNome = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtCpf = TextEditingController();
  var txtNickname = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
        child: Column(
          children: [
            Text(
              'Criar Conta',
              style: TextStyle(fontSize: 60, color: Color.fromARGB(255, 102, 51, 6)),
            ),
            SizedBox(height: 60),
            TextField(
              controller: txtNome,
              decoration: InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 102, 51, 6)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtTelefone,
              decoration: InputDecoration(
                  labelText: 'Telefone',
                  prefixIcon: Icon(Icons.call, color: Color.fromARGB(255, 102, 51, 6)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtCpf,
              decoration: InputDecoration(
                  labelText: 'Cpf',
                  prefixIcon: Icon(Icons.call, color: Color.fromARGB(255, 102, 51, 6)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtNickname,
              decoration: InputDecoration(
                  labelText: 'Nickname',
                  prefixIcon: Icon(Icons.call, color: Color.fromARGB(255, 102, 51, 6)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Color.fromARGB(255, 102, 51, 6)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtSenha,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Senha',
                  prefixIcon: Icon(Icons.password, color: Color.fromARGB(255, 102, 51, 6)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancelar'),
                ),
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(140, 40),
                  ),
                  onPressed: () {
                    LoginController().criarConta(
                      context,
                      txtNome.text,
                      txtTelefone.text,
                      txtCpf.text,
                      txtNickname.text,
                      txtEmail.text,
                      txtSenha.text,
                    );
                  },
                  child: Text('salvar'),
                ),
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}