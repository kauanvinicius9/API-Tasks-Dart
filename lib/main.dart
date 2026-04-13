import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/telaget.dart';

void main() {
  runApp(const Tasks());
}

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Telaget()

    );
  }
}