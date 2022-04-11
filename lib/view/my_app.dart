import 'package:flutter/material.dart';
import 'package:sigla_paises/view/paises_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sigla dos Países',
      home: PaisesScreen(),
    );
  }
}