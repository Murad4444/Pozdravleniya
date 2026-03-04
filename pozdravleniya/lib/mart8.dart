import 'package:flutter/material.dart';

class Mart8Screen extends StatelessWidget {
  const Mart8Screen({super.key});

  // Если тебе нужна функция для кнопки, опиши её здесь
  //void _opencard() {
    
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _opencard,
            child: const Text("Открыть!"),
          ),
        ],
      ),
    );
  }
}
