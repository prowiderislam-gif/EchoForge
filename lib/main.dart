import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

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
      theme: AppTheme.darkTheme,
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
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.cyan,
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x9900E5FF),
                      blurRadius: 18,
                      spreadRadius: 2,
                    ),
                    BoxShadow(
                      color: Color(0x662979FF),
                      blurRadius: 40,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.mic_none_rounded,
                  size: 65,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: AppTheme.cyan,
                      blurRadius: 8,
                    ),
                    Shadow(
                      color: AppTheme.cyan,
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'EchoForge',
                style: AppTheme.neonTitle,
              ),
              const SizedBox(height: 12),
              const Text(
                'Your Personal AI Voice Studio',
                style: AppTheme.softNeonText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
