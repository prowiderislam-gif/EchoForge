import 'dart:async';

class VoiceRecorderService {
  bool _isRecording = false;
  Timer? _timer;
  int _seconds = 0;

  bool get isRecording => _isRecording;
  int get seconds => _seconds;

  Future<bool> startRecording() async {
    if (_isRecording) {
      return false;
    }

    _isRecording = true;
    _seconds = 0;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        _seconds++;
      },
    );

    return true;
  }

  Future<void> stopRecording() async {
    _isRecording = false;
    _timer?.cancel();
    _timer = null;
  }

  Future<void> cancelRecording() async {
    _isRecording = false;
    _seconds = 0;
    _timer?.cancel();
    _timer = null;
  }

  String get formattedDuration {
    final minutes = (_seconds ~/ 60).toString().padLeft(2, '0');
    final secondsPart = (_seconds % 60).toString().padLeft(2, '0');

    return '$minutes:$secondsPart';
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
