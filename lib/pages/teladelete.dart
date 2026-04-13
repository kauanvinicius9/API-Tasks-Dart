import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Teladelete extends StatefulWidget {
  const Teladelete({super.key});

  @override
  State<Teladelete> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Teladelete> {
  List resultado = [];

  void initState() {
    super.initState();
    fazerget();
  }

  void fazerget() async {
    final respostaServidor = await http.get(Uri.parse("http://10.109.72.10:3000/tasks"));

    if (respostaServidor.statusCode == 200) {
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        resultado = dados;
      });
    }
  }

  void fazerdelete(final id) async {
    final respostaServidor = await http.delete(Uri.parse("http://10.109.72.10:3000/tasks/$id"));

    if (respostaServidor.statusCode == 200 || respostaServidor.statusCode == 204) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Tarefa deletada com sucesso")
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Tasks")),

        body: ListView(
          children: [
            for(final item in resultado)
            Card(
              child: ListTile(
                leading: Text(item["name"]),
                trailing: GestureDetector(
                  onTap: (){fazerdelete(item["id"]);},
                  child: Icon(Icons.delete),

                ),
              ),
            )
          ],
      ),
    );
  }
}