import 'dart:typed_data';

import 'package:flutter/services.dart';

class AndroidDownloadService {
  static const MethodChannel _channel =
      MethodChannel('echoforge/storage');

  Future<String?> saveAudio({
    required Uint8List audioBytes,
    required String fileName,
  }) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'saveAudioToDownload',
        <String, dynamic>{
          'fileName': fileName,
          'audioBytes': audioBytes,
        },
      );

      return result;
    } on PlatformException {
      return null;
    }
  }

  Future<bool> saveAudioSuccessfully({
    required Uint8List audioBytes,
    required String fileName,
  }) async {
    final result = await saveAudio(
      audioBytes: audioBytes,
      fileName: fileName,
    );

    return result != null && result.isNotEmpty;
  }
}
