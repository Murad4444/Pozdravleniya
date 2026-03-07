import 'package:flutter/material.dart';

class Mart8Screen extends StatefulWidget {
  const Mart8Screen({super.key});

  @override
  State<Mart8Screen> createState() => _Mart8ScreenState();
}

class _Mart8ScreenState extends State<Mart8Screen> {
  bool _isImageVisible = false;

  void _opencard() {
    setState(() {
      _isImageVisible = true;
    }); 
  }

  void _closecard() {
    setState(() {
      _isImageVisible = false;
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _opencard,
              child: const Text("Открыть!"),
            ),
            ElevatedButton(
              onPressed: _closecard,
              child: const Text("Закрыть!"),
            ),
            const SizedBox(height: 20),

            if (_isImageVisible) 
              Image.asset(
                'assets/pozdra.png',
                width: 200,
              ),
          ], // Закрываем children
        ), // Закрываем Column
      ), // Закрываем Center
    ); // Закрываем Scaffold
  }
}