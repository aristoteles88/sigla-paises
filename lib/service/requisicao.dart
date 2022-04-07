import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Requisicao{
  Future<List> requisicaoPaises() async {

    Map paises = Map();

    Uri apiUrl = Uri(scheme: "https", host: "api.nobelprize.org", path:"v1/country.json");

    http.Response response = await http.get(apiUrl);
    debugPrint("Status Code: ${response.statusCode}");
    debugPrint("Body: ${response.body}");

    if (response.statusCode == 200) {
      paises = jsonDecode(response.body);
      return paises.values.first;
    } else {
      throw Exception("Falhou requisição");
    }
  }
}