import 'package:flutter/material.dart';

void main() {
  runApp(const EchoForgeApp());
}

class EchoForgeApp extends StatelessWidget {
  const EchoForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EchoForge',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050B12),
        useMaterial3: true,
      ),
      home: const EchoForgeHome(),
    );
  }
}

class EchoForgeHome extends StatelessWidget {
  const EchoForgeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.mic_none_rounded,
                size: 90,
                color: Color(0xFF38D9FF),
              ),
              const SizedBox(height: 24),
              const Text(
                'EchoForge',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your Personal AI Voice Studio',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.65),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
