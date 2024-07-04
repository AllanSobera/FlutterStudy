import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(38, 129, 106, 1),
        title: const Text(
          "Home",
          style: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(255, 255, 255, 1.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Clicado");
        },
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(38, 129, 106, 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
