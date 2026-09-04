import 'dart:typed_data';

import 'audio_file_service.dart';

class TtsAudioService {
  final AudioFileService _audioFileService =
      AudioFileService();

  Future<String?> saveGeneratedVoice({
    required Uint8List audioBytes,
    String? fileName,
  }) async {
    if (audioBytes.isEmpty) {
      return null;
    }

    return _audioFileService.saveGeneratedAudio(
      audioBytes: audioBytes,
      fileName: fileName,
    );
  }

  Future<bool> saveGeneratedVoiceSuccessfully({
    required Uint8List audioBytes,
    String? fileName,
  }) async {
    final savedPath = await saveGeneratedVoice(
      audioBytes: audioBytes,
      fileName: fileName,
    );

    return savedPath != null && savedPath.isNotEmpty;
  }
}
