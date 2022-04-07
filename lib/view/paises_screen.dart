import 'package:flutter/material.dart';
import 'package:sigla_paises/service/requisicao.dart';
import 'package:sigla_paises/view/paises_dados.dart';

import 'menu.dart';

class PaisesScreen extends StatelessWidget {
  const PaisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sigla dos Países"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.refresh)
          ),
        ],
      ),
      body: PaisesDados(),
      drawer: Menu(),
    );
  }
}
