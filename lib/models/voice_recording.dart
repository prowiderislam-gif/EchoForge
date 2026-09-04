class VoiceRecording {
  final String id;
  final String name;
  final String? filePath;
  final Duration duration;
  final DateTime createdAt;

  const VoiceRecording({
    required this.id,
    required this.name,
    this.filePath,
    required this.duration,
    required this.createdAt,
  });

  VoiceRecording copyWith({
    String? id,
    String? name,
    String? filePath,
    Duration? duration,
    DateTime? createdAt,
  }) {
    return VoiceRecording(
      id: id ?? this.id,
      name: name ?? this.name,
      filePath: filePath ?? this.filePath,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
