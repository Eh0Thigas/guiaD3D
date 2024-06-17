
import 'package:ddguia/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/API/dano_view.dart';
import 'view/API/racas_view.dart';
import 'view/dados_view.dart';
import 'view/API/equipamentos_view.dart';
import 'view/login/cadastrar_view.dart';
import 'view/API/classes_view.dart';
import 'view/API/condicoes_view.dart';
import 'view/login/login_view.dart';
import 'view/missoes_view.dart';
import 'view/API/monstros_view.dart';
import 'view/personagem_view.dart';
import 'view/principal_view.dart';
import 'view/login/usuarios_view.dart';

Future <void> main() async{

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginView(),
        'cadastrar': (context) => const CadastrarLoginView(),
        'principal': (context) => const PrincipalView(),
        'usuario': (context) => const UsuariosView(),
        'personagens': (context) => const PersonagemView(),
        'missoes': (context) => const MissoesView(),
        'dados': (context) => const DadosView(),
        //'sobre': (context) => const SobreView(),
        'classes': (context) => const ClassesView(),
        'condicoes': (context) => const CondicoesView(),
        'equipamentos': (context) => const EquipamentosView(),
        'monstros': (context) => const MonstrosView(),
        'tipos_de_dados': (context) => const DanoView(),
        'racas': (context) => const RacasView(),
      }
    );
  }
}

