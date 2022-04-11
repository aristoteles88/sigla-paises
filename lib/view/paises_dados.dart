import 'package:flutter/material.dart';
import 'package:sigla_paises/service/requisicao.dart';

class PaisesDados extends StatefulWidget {
  const PaisesDados({Key? key, required this.pais}) : super(key: key);

  final String pais;

  @override
  State<PaisesDados> createState() => _PaisesDadosState();
}

class _PaisesDadosState extends State<PaisesDados> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: Requisicao().requisicaoPaises(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot){
            if (snapshot.hasData) {
              List? paises = snapshot.data;
              return _listaPaises(_filtraPaises(widget.pais, paises!, context));
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
    );
  }

  Widget _listaPaises(List? paises) {
    return paises != null ? Flexible(
      child: ListView.builder(
        itemCount: paises.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              textColor: Colors.orangeAccent,
              title: Text(
                "${paises[index]["name"]}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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

List _filtraPaises(String pais, List paises, BuildContext context) {
  List filtro = [];
  for (var element in paises) {
    if ((element["name"] as String).toLowerCase() == pais.toLowerCase()) {
      filtro.add(element);
    }
  }
  return filtro.isEmpty? paises : filtro;
}
