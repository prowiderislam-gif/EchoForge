import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/neon_glow_button.dart';
import '../widgets/neon_glow_text.dart';
import '../widgets/neon_shimmer_border.dart';
import '../widgets/neon_waveform.dart';

class RecordVoiceScreen extends StatefulWidget {
  const RecordVoiceScreen({super.key});

  @override
  State<RecordVoiceScreen> createState() => _RecordVoiceScreenState();
}

class _RecordVoiceScreenState extends State<RecordVoiceScreen> {
  bool _isRecording = false;
  int _seconds = 0;

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;

      if (_isRecording) {
        _seconds = 0;
      }
    });
  }

  String _formatTime() {
    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const NeonGlowText(
          'Record Voice',
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
            children: [
              const SizedBox(height: 20),
              NeonShimmerBorder(
                borderRadius: 30,
                padding: const EdgeInsets.all(1.2),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xE8050B12),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Column(
                    children: [
                      NeonGlowText(
                        _isRecording
                            ? 'Recording...'
                            : 'Ready to Record',
                        fontSize: 24,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isRecording
                            ? 'Speak clearly and naturally'
                            : 'Use a quiet room for the cleanest sample',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 26),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _isRecording
                                ? AppTheme.cyan
                                : const Color(0x6600E5FF),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x6600E5FF),
                              blurRadius: _isRecording ? 30 : 20,
                              spreadRadius: _isRecording ? 5 : 2,
                            ),
                            const BoxShadow(
                              color: Color(0x442979FF),
                              blurRadius: 45,
                            ),
                          ],
                        ),
                        child: Icon(
                          _isRecording
                              ? Icons.stop_rounded
                              : Icons.mic_rounded,
                          size: 48,
                          color: Colors.white,
                          shadows: const [
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
                      const SizedBox(height: 20),
                      NeonGlowText(
                        _formatTime(),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(height: 18),
                      NeonWaveform(
                        height: 70,
                        barCount: 30,
                        animate: _isRecording,
                      ),
                      const SizedBox(height: 24),
                      NeonGlowButton(
                        text: _isRecording
                            ? 'Stop Recording'
                            : 'Start Recording',
                        icon: _isRecording
                            ? Icons.stop_rounded
                            : Icons.mic_rounded,
                        onPressed: _toggleRecording,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0x44101F2C),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0x4400E5FF),
                  ),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: AppTheme.cyan,
                      size: 26,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'For a better voice profile, speak for at least 30 seconds using your normal voice.',
                        style: TextStyle(
                          color: Color(0xB3FFFFFF),
                          fontSize: 13,
                          height: 1.45,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
