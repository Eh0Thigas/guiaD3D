
import 'package:ddguia/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/cadastrar_view.dart';
import 'view/classes_view.dart';
import 'view/login_view.dart';
import 'view/principal_view.dart';

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
      //home: CadastrarView(),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginView(),
        'cadastrar': (context) => const CadastrarLoginView(),
        'principal': (context) => const PrincipalView(),
        'classes': (context) => const ClassesView(),
      }
    );
  }
}

