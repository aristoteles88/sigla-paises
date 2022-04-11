import 'package:flutter/material.dart';
import 'package:sigla_paises/view/paises_dados.dart';

import 'menu.dart';

class PaisesScreen extends StatelessWidget {
  const PaisesScreen({Key? key, this.pais = ""}) : super(key: key);

  final String pais;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sigla dos Países"),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const PaisesScreen(pais: "")
                    )
                );
              },
              icon: const Icon(Icons.refresh)
          ),
        ],
      ),
      body: PaisesDados(pais: pais),
      drawer: Menu(),
    );
  }
}
