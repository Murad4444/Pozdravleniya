import 'package:flutter/material.dart';

class Mart8Screen extends StatelessWidget {
  const Mart8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // ВАЖНО: отключаем стандартную стрелку слева
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back), // Твоя стрелочка
            onPressed: () {
              Navigator.pop(context); // Возврат назад
            },
          ),
        ],
      ),
      body: Column(
        // Это выравнивает вещи по ВЕРТИКАЛИ (сверху вниз)
        mainAxisAlignment: MainAxisAlignment.start, 
        
        // Это выравнивает вещи по ГОРИЗОНТАЛИ (по центру)
        crossAxisAlignment: CrossAxisAlignment.center, 
        
        children: [
          const SizedBox(height: 20), // Отступ от AppBar (чтобы не прилипало)
          const ElevatedButton(onPressed: onPressed, child: child)
        ],
      ),
    );
  }
}