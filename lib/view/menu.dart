import 'package:flutter/material.dart';

import 'ajuda.dart';

class Menu extends StatelessWidget {
  Menu({Key? key}) : super(key: key);

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                color: Theme.of(context).primaryColor,
                height: 100.0,
                child: const Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text("Pesquisar"),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => SimpleDialog(
                      title: Text("Digite o nome do país"),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: TextField(
                            controller: search,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK")
                            ),
                          ],
                        ),
                      ],
                    )
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.help),
                title: const Text("Ajuda"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Ajuda()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
