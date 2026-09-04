import 'dart:typed_data';

import 'tts_audio_service.dart';

class TtsGenerationService {
  final TtsAudioService _audioService =
      TtsAudioService();

  bool _isGenerating = false;

  bool get isGenerating => _isGenerating;

  Future<String?> generateAndSave({
    required String text,
    Uint8List? generatedAudioBytes,
    String? fileName,
  }) async {
    if (_isGenerating) {
      return null;
    }

    if (text.trim().isEmpty) {
      return null;
    }

    if (generatedAudioBytes == null ||
        generatedAudioBytes.isEmpty) {
      return null;
    }

    _isGenerating = true;

    try {
      final savedPath = await _audioService.saveGeneratedVoice(
        audioBytes: generatedAudioBytes,
        fileName: fileName,
      );

      return savedPath;
    } finally {
      _isGenerating = false;
    }
  }

  Future<bool> saveGeneratedAudio({
    required Uint8List audioBytes,
    String? fileName,
  }) async {
    if (audioBytes.isEmpty) {
      return false;
    }

    final savedPath =
        await _audioService.saveGeneratedVoice(
      audioBytes: audioBytes,
      fileName: fileName,
    );

    return savedPath != null && savedPath.isNotEmpty;
  }
}
