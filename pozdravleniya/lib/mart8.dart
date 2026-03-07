import 'package:flutter/material.dart';

class Mart8Screen extends StatefulWidget {
  const Mart8Screen({super.key});

  @override
  State<Mart8Screen> createState() => _Mart8ScreenState();
}

class _Mart8ScreenState extends State<Mart8Screen> {
  // 1. Переменная должна быть ТУТ, внутри State
  bool _isImageVisible = false;

  // Если тебе нужна функция для кнопки, опиши её здесь
  void _opencard() {
    setState(() {
      _isImageVisible = true;
      
    }); 
    
  }

  // Если тебе нужна функция для кнопки, опиши её здесь
  void _closecard() {
    _isImageVisible = false; 
    
  }

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

          ElevatedButton(
            onPressed: _closecard,
            child: const Text("Закрыть!"),
          ),
          const SizedBox(height: 20),

          // Твоя картинка из папки assets
        if (_isImageVisible) 
              Image.asset(
                'assets/my_image.jpg',
                width: 200,
              ),
        ],
      ),
    );
  }
}
