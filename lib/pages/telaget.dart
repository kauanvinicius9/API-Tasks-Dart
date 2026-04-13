import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
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
  // 10.109.72.10
  void fazerget() async {

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Telaget()
    );
  }
}

