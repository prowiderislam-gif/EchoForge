import 'dart:typed_data';

import 'android_download_service.dart';

class AudioFileService {
  final AndroidDownloadService _downloadService =
      AndroidDownloadService();

  Future<String?> saveGeneratedAudio({
    required Uint8List audioBytes,
    String? fileName,
  }) async {
    final name = fileName ?? _createFileName();

    return _downloadService.saveAudio(
      audioBytes: audioBytes,
      fileName: name,
    );
  }

  Future<bool> saveGeneratedAudioSuccessfully({
    required Uint8List audioBytes,
    String? fileName,
  }) async {
    final path = await saveGeneratedAudio(
      audioBytes: audioBytes,
      fileName: fileName,
    );

    return path != null && path.isNotEmpty;
  }

  String _createFileName() {
    final now = DateTime.now();

    final year = now.year.toString().padLeft(4, '0');
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');
    final second = now.second.toString().padLeft(2, '0');

    return 'EchoForge_${year}${month}${day}_'
        '${hour}${minute}${second}.wav';
  }
}
