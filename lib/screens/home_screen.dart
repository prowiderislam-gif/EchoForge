import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/neon_glow_button.dart';
import '../widgets/neon_glow_text.dart';
import '../widgets/neon_shimmer_border.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NeonGlowText(
                'EchoForge',
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 6),
              Text(
                'Personal AI Voice Studio',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.55),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 28),

              NeonShimmerBorder(
                borderRadius: 28,
                padding: const EdgeInsets.all(1.2),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xE8050B12),
                    borderRadius: BorderRadius.circular(27),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 92,
                        height: 92,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0x33101F2C),
                          border: Border.all(
                            color: AppTheme.cyan,
                            width: 1.5,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x8800E5FF),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                            BoxShadow(
                              color: Color(0x552979FF),
                              blurRadius: 40,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.mic_none_rounded,
                          size: 46,
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
                      const SizedBox(height: 20),
                      const NeonGlowText(
                        'Create Your Voice',
                        fontSize: 22,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Record or prepare your voice for AI generation.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 22),
                      NeonGlowButton(
                        text: 'Start Recording',
                        icon: Icons.mic_rounded,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const NeonGlowText(
                'Quick Actions',
                fontSize: 20,
              ),
              const SizedBox(height: 14),

              Row(
                children: [
                  Expanded(
                    child: _ActionCard(
                      icon: Icons.record_voice_over_rounded,
                      title: 'Voice',
                      subtitle: 'My Voice',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _ActionCard(
                      icon: Icons.text_fields_rounded,
                      title: 'Text',
                      subtitle: 'AI Speech',
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              const NeonGlowText(
                'Recent',
                fontSize: 20,
              ),
              const SizedBox(height: 14),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0x55101F2C),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0x4400E5FF),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.graphic_eq_rounded,
                      color: AppTheme.cyan,
                      size: 30,
                      shadows: [
                        Shadow(
                          color: AppTheme.cyan,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        'No recordings yet',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.65),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppTheme.cyan,
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

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0x55101F2C),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0x5500E5FF),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x2200E5FF),
              blurRadius: 16,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.mic_rounded,
              color: AppTheme.cyan,
              size: 28,
              shadows: [
                Shadow(
                  color: AppTheme.cyan,
                  blurRadius: 10,
                ),
              ],
            ),
            const SizedBox(height: 12),
            NeonGlowText(
              title,
              fontSize: 16,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.48),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
