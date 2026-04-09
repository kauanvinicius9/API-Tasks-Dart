import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

