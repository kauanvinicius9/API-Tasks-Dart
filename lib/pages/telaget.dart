import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/pages/teladelete.dart';
import 'package:flutter_application_1/pages/telapost.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: const Tasks()),
  );
}

class Telaget extends StatefulWidget {
  const Telaget({super.key});

  @override
  State<Telaget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Telaget> {
  String resultado = "";

  void fazerget() async {
    final respostaServidor = await http.get(Uri.parse("http://10.109.72.10:3000/tasks"));

    if (respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        resultado = dados[1]["name"];

        // for(int i in dados){
        //   if(dados[i] == 1){
        //     resultado = dados[i]["name"];
        //   }
        // }

      });
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
            Text(resultado),
            TextButton(
              onPressed: fazerget,
              child: Text("Fazer GET"),
            ),

            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Teladelete()));
              },
              child: Text("Ir para Delete"),
            ),

            TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Telapost()));
              },
              child: Text("Ir para POST")
            )
          ],
        ),
      ),
    );
  }
}