import 'dart:io';

class AudioStorageService {
  Future<bool> fileExists(String filePath) async {
    return File(filePath).exists();
  }

  Future<int> fileSize(String filePath) async {
    final file = File(filePath);

    if (!await file.exists()) {
      return 0;
    }

    return file.length();
  }

  Future<void> deleteFile(String filePath) async {
    final file = File(filePath);

    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<void> renameFile(
    String oldPath,
    String newPath,
  ) async {
    final file = File(oldPath);

    if (!await file.exists()) {
      return;
    }

    await file.rename(newPath);
  }
}
