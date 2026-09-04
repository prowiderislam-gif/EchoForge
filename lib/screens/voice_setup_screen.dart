import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/neon_glow_button.dart';
import '../widgets/neon_glow_text.dart';
import '../widgets/neon_shimmer_border.dart';

class VoiceSetupScreen extends StatefulWidget {
  const VoiceSetupScreen({super.key});

  @override
  State<VoiceSetupScreen> createState() => _VoiceSetupScreenState();
}

class _VoiceSetupScreenState extends State<VoiceSetupScreen> {
  bool isRecording = false;
  bool hasVoiceSample = false;

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
      if (isRecording) {
        hasVoiceSample = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const NeonGlowText(
          'Voice Setup',
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const NeonGlowText(
                'Create Your Voice Profile',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 10),
              Text(
                'Use a clear recording of your voice as the starting point for EchoForge.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.55),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),

              NeonShimmerBorder(
                borderRadius: 30,
                padding: const EdgeInsets.all(1.2),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xE8050B12),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isRecording ? 112 : 100,
                        height: isRecording ? 112 : 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isRecording
                                ? AppTheme.electricBlue
                                : AppTheme.cyan,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isRecording
                                  ? const Color(0xAA2979FF)
                                  : const Color(0x8800E5FF),
                              blurRadius: isRecording ? 32 : 22,
                              spreadRadius: isRecording ? 5 : 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          isRecording
                              ? Icons.stop_rounded
                              : Icons.mic_none_rounded,
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
                      const SizedBox(height: 22),
                      NeonGlowText(
                        isRecording
                            ? 'Recording...'
                            : hasVoiceSample
                                ? 'Sample Ready'
                                : 'Ready to Record',
                        fontSize: 20,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isRecording
                            ? 'Speak naturally and clearly.'
                            : hasVoiceSample
                                ? 'Your voice sample is ready for the next step.'
                                : 'Tap below to begin your voice sample.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 24),
                      NeonGlowButton(
                        text: isRecording
                            ? 'Stop Recording'
                            : 'Start Recording',
                        icon: isRecording
                            ? Icons.stop_rounded
                            : Icons.mic_rounded,
                        onPressed: _toggleRecording,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 26),

              Align(
                alignment: Alignment.centerLeft,
                child: const NeonGlowText(
                  'Recording Tips',
                  fontSize: 19,
                ),
              ),
              const SizedBox(height: 14),

              _TipCard(
                icon: Icons.volume_up_rounded,
                text: 'Speak at a normal volume and natural speed.',
              ),
              const SizedBox(height: 10),
              _TipCard(
                icon: Icons.noise_aware_rounded,
                text: 'Record in a quiet place with minimal background noise.',
              ),
              const SizedBox(height: 10),
              _TipCard(
                icon: Icons.phone_android_rounded,
                text: 'Keep the phone microphone at a comfortable distance.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const _TipCard({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0x44101F2C),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0x4400E5FF),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppTheme.cyan,
            size: 24,
            shadows: const [
              Shadow(
                color: AppTheme.cyan,
                blurRadius: 10,
              ),
            ],
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.68),
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
