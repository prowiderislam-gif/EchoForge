import 'package:flutter/material.dart';

import '../models/voice_recording.dart';
import '../theme/app_theme.dart';
import '../widgets/neon_glow_button.dart';
import '../widgets/neon_glow_text.dart';
import '../widgets/neon_shimmer_border.dart';

class VoiceLibraryScreen extends StatefulWidget {
  const VoiceLibraryScreen({super.key});

  @override
  State<VoiceLibraryScreen> createState() => _VoiceLibraryScreenState();
}

class _VoiceLibraryScreenState extends State<VoiceLibraryScreen> {
  final List<VoiceRecording> _recordings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const NeonGlowText(
          'Voice Library',
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
        child: _recordings.isEmpty
            ? _EmptyLibrary(
                onAddVoice: () {
                  Navigator.of(context).pushNamed('/record');
                },
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                itemCount: _recordings.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final recording = _recordings[index];

                  return _VoiceCard(
                    recording: recording,
                    onDelete: () {
                      setState(() {
                        _recordings.removeAt(index);
                      });
                    },
                  );
                },
              ),
      ),
    );
  }
}

class _EmptyLibrary extends StatelessWidget {
  final VoidCallback onAddVoice;

  const _EmptyLibrary({
    required this.onAddVoice,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppTheme.cyan,
                  width: 1.5,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x6600E5FF),
                    blurRadius: 24,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Color(0x442979FF),
                    blurRadius: 45,
                  ),
                ],
              ),
              child: const Icon(
                Icons.library_music_rounded,
                size: 46,
                color: AppTheme.cyan,
                shadows: [
                  Shadow(
                    color: AppTheme.cyan,
                    blurRadius: 10,
                  ),
                  Shadow(
                    color: AppTheme.cyan,
                    blurRadius: 22,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const NeonGlowText(
              'Your Voice Library',
              fontSize: 24,
            ),
            const SizedBox(height: 10),
            Text(
              'Your saved voice recordings will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.55),
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            NeonGlowButton(
              text: 'Add Voice',
              icon: Icons.add_rounded,
              onPressed: onAddVoice,
            ),
          ],
        ),
      ),
    );
  }
}

class _VoiceCard extends StatelessWidget {
  final VoiceRecording recording;
  final VoidCallback onDelete;

  const _VoiceCard({
    required this.recording,
    required this.onDelete,
  });

  String _durationText() {
    final minutes = recording.duration.inMinutes
        .toString()
        .padLeft(2, '0');

    final seconds = (recording.duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0');

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return NeonShimmerBorder(
      borderRadius: 20,
      padding: const EdgeInsets.all(1),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xE8050B12),
          borderRadius: BorderRadius.circular(19),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0x33101F2C),
                border: Border.all(
                  color: const Color(0x6600E5FF),
                ),
              ),
              child: const Icon(
                Icons.record_voice_over_rounded,
                color: AppTheme.cyan,
                shadows: [
                  Shadow(
                    color: AppTheme.cyan,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NeonGlowText(
                    recording.name,
                    fontSize: 16,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Duration  ${_durationText()}',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.48),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Delete',
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete_outline_rounded,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
