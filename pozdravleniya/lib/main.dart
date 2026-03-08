import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
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
  // ТЕКУЩАЯ ВЕРСИЯ (когда выпустишь обновление, в новом коде поменяй на 2)
  final int currentBuildNumber = 2; 
  final String jsonUrl = "https://raw.githubusercontent.com/Murad4444/Pozdravleniya/refs/heads/main/pozdravleniya/version.json";
  
  Timer? _updateTimer;

  @override
  void initState() {
    super.initState();
    // 1. Проверка сразу при запуске
    checkUpdate();
    
    // 2. Проверка каждые 24 часа, если приложение не закрыто
    _updateTimer = Timer.periodic(const Duration(hours: 24), (timer) {
      checkUpdate();
    });
  }

  @override
  void dispose() {
    _updateTimer?.cancel();
    super.dispose();
  }

  Future<void> checkUpdate() async {
    try {
      final response = await http.get(Uri.parse(jsonUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        int newBuildNumber = data['build_number'];
        String updateUrl = data['url'];

        if (newBuildNumber > currentBuildNumber) {
          _showUpdateDialog(updateUrl);
        }
      }
    } catch (e) {
      debugPrint("Ошибка OTA: $e");
    }
  }

  void _showUpdateDialog(String url) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text("Доступно обновление!"),
        content: const Text("Хотите скачать новую версию приложения?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Позже"),
          ),
          ElevatedButton(
            onPressed: () async {
              final Uri _url = Uri.parse(url);
              if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) {
                debugPrint('Не удалось открыть ссылку');
              }
            },
            child: const Text("Скачать"),
          ),
        ],
      ),
    );
  }
  
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
