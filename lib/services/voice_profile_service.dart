import '../models/voice_recording.dart';

class VoiceProfileService {
  VoiceRecording? _currentVoice;

  VoiceRecording? get currentVoice => _currentVoice;

  bool get hasVoiceProfile => _currentVoice != null;

  void setVoiceProfile(VoiceRecording recording) {
    _currentVoice = recording;
  }

  void clearVoiceProfile() {
    _currentVoice = null;
  }

  String get voiceName {
    return _currentVoice?.name ?? 'My Voice';
  }

  Duration get voiceDuration {
    return _currentVoice?.duration ?? Duration.zero;
  }
}
