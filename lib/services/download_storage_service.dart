import 'dart:io';

class DownloadStorageService {
  static const String _folderName = 'EchoForge';

  Future<Directory> getEchoForgeDirectory() async {
    final downloadDirectory = Directory(
      '/storage/emulated/0/Download',
    );

    final echoForgeDirectory = Directory(
      '${downloadDirectory.path}/$_folderName',
    );

    if (!await echoForgeDirectory.exists()) {
      await echoForgeDirectory.create(
        recursive: true,
      );
    }

    return echoForgeDirectory;
  }

  Future<String> saveAudioFile({
    required List<int> audioBytes,
    required String fileName,
  }) async {
    final directory = await getEchoForgeDirectory();

    final safeFileName = _sanitizeFileName(fileName);

    final file = File(
      '${directory.path}/$safeFileName',
    );

    await file.writeAsBytes(
      audioBytes,
      flush: true,
    );

    return file.path;
  }

  Future<bool> exists(String fileName) async {
    final directory = await getEchoForgeDirectory();
    final file = File(
      '${directory.path}/${_sanitizeFileName(fileName)}',
    );

    return file.exists();
  }

  Future<void> deleteFile(String fileName) async {
    final directory = await getEchoForgeDirectory();

    final file = File(
      '${directory.path}/${_sanitizeFileName(fileName)}',
    );

    if (await file.exists()) {
      await file.delete();
    }
  }

  String _sanitizeFileName(String fileName) {
    var name = fileName.trim();

    if (name.isEmpty) {
      name = 'EchoForge_Audio.wav';
    }

    name = name.replaceAll(
      RegExp(r'[\\/:*?"<>|]'),
      '_',
    );

    if (!name.contains('.')) {
      name = '$name.wav';
    }

    return name;
  }
}
