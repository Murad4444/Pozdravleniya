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
    body: Center( // Добавляем Center, чтобы Column был в середине экрана
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          // crossAxisAlignment теперь будет работать правильно внутри Center
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            const SizedBox(height: 50), 
            ElevatedButton(
              onPressed: _opencard, 
              child: const Text("Открыть!"),
            ),
            const SizedBox(height: 10), // Небольшой отступ между кнопками
            ElevatedButton(
              onPressed: _closecard, 
              child: const Text("Закрыть!"),
            ),
            
            const SizedBox(height: 30), 

            if (_isImageVisible) 
              Image.asset(
                'assets/pozdra.png',
                // Картинка будет занимать 90% ширины экрана — это очень крупно!
                width: MediaQuery.of(context).size.width * 0.9, 
                fit: BoxFit.contain, // ИСПРАВЛЕНО: BoxFit вместо Widget
              ),
          ],
        ),
        ),
    ); // Закрываем Scaffold
  }
}