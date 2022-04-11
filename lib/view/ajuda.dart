import 'package:flutter/material.dart';

class Ajuda extends StatelessWidget {
  const Ajuda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajuda"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: false,
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text("Este aplicativo tem como objetivo listar e pesquisar as siglas dos paises."),
          )
        ],
      ),
    );
  }
}
