import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Telapost extends StatefulWidget {
  const Telapost({super.key});

  @override
  State<Telapost> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Telapost> {
  TextEditingController valorDigitado = TextEditingController();

  void fazepost() async {
    final respostaServidor = await http.post(
       Uri.parse("http://10.109.72.10:3000/tasks"),
       headers: {"Content-Type": "application/json"},
       body: jsonEncode({
        "name": valorDigitado.text

       })
    );

    if (respostaServidor.statusCode == 200 || respostaServidor.statusCode == 201){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Tarefa enviada com sucesso")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Tasks")),

      body: Center(
        child: Column(
          children: [
            TextField(
              controller: valorDigitado,
            ),
          ],
        ),
      )
    );
  }
}