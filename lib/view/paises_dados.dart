import 'package:flutter/material.dart';
import 'package:sigla_paises/service/requisicao.dart';

class PaisesDados extends StatefulWidget {
  const PaisesDados({Key? key}) : super(key: key);

  @override
  State<PaisesDados> createState() => _PaisesDadosState();
}

class _PaisesDadosState extends State<PaisesDados> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            future: Requisicao().requisicaoPaises(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
              if (snapshot.hasData) {
                List? paises = snapshot.data;
                return _listaPaises(paises);
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Text(
                      "Carregando...",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _listaPaises(List? paises) {
    return paises != null ? Flexible(
      child: ListView.builder(
        itemCount: paises.length,
        itemBuilder: (context, index) {
          return Container(
            child: Card(
              child: ExpansionTile(
                title: Text(
                  "${paises[index]["name"]}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${paises[index]["code"] ?? "--"}",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    ) : Container(
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.all(50.0),
        child: Text(
          "Carregando...",
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
