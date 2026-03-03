import 'package:flutter/material.dart';
import 'mart8.dart';

void main() {
  runApp(const MaterialApp(
    home: pzdrapp(),
    debugShowCheckedModeBanner: false,
  ));
}

class pzdrapp extends StatefulWidget {
  const pzdrapp({super.key});

  @override
  State<pzdrapp> createState() => _pzdrappState();
}

class _pzdrappState extends State<pzdrapp> {
  void _opencard() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Mart8Screen()),
    );
  

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      appBar: AppBar(
        title: const Text("Мои поздравления"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
              onPressed: _opencard,
              child: const Text("Открыть открытку!"),
            ),
          ],
        ),
      ),
    );
  }
}