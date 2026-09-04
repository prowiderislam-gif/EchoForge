import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/neon_glow_button.dart';
import '../widgets/neon_glow_text.dart';
import '../widgets/neon_shimmer_border.dart';

class TextToSpeechScreen extends StatefulWidget {
  const TextToSpeechScreen({super.key});

  @override
  State<TextToSpeechScreen> createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen> {
  final TextEditingController _textController = TextEditingController();

  String _selectedVoice = 'My Voice';
  double _speed = 1.0;
  double _pitch = 0.0;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const NeonGlowText(
          'Text to Speech',
          fontSize: 20,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NeonGlowText(
                'Enter Text',
                fontSize: 20,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12),
              NeonShimmerBorder(
                borderRadius: 22,
                padding: const EdgeInsets.all(1),
                child: Container(
                  height: 190,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xE8050B12),
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: TextField(
                    controller: _textController,
                    maxLines: null,
                    expands: true,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.5,
                    ),
                    cursorColor: AppTheme.cyan,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText:
                          'Type something you want EchoForge to speak...',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.35),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const NeonGlowText(
                'Voice',
                fontSize: 20,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0x55101F2C),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0x6600E5FF),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedVoice,
                    dropdownColor: const Color(0xFF08131D),
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppTheme.cyan,
                    ),
                    isExpanded: true,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'My Voice',
                        child: Text('My Voice'),
                      ),
                      DropdownMenuItem(
                        value: 'Default Voice',
                        child: Text('Default Voice'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }

                      setState(() {
                        _selectedVoice = value;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const NeonGlowText(
                'Speed',
                fontSize: 18,
                textAlign: TextAlign.left,
              ),
              Slider(
                value: _speed,
                min: 0.5,
                max: 2.0,
                divisions: 15,
                activeColor: AppTheme.cyan,
                inactiveColor: const Color(0x442979FF),
                label: '${_speed.toStringAsFixed(1)}x',
                onChanged: (value) {
                  setState(() {
                    _speed = value;
                  });
                },
              ),
              const SizedBox(height: 8),
              const NeonGlowText(
                'Pitch',
                fontSize: 18,
                textAlign: TextAlign.left,
              ),
              Slider(
                value: _pitch,
                min: -1.0,
                max: 1.0,
                divisions: 20,
                activeColor: AppTheme.cyan,
                inactiveColor: const Color(0x442979FF),
                label: _pitch.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    _pitch = value;
                  });
                },
              ),
              const SizedBox(height: 22),
              Center(
                child: NeonGlowButton(
                  text: 'Generate Speech',
                  icon: Icons.auto_awesome_rounded,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
