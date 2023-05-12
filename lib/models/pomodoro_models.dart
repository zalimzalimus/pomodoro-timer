class PomodoroModels {
  final double time;
  final bool isPlay;
  final int rounds;
  final int goal;
  final String currentMood;
  PomodoroModels({
    required this.time,
    required this.isPlay,
    required this.rounds,
    required this.goal,
    required this.currentMood,
  });

  PomodoroModels copyWith({
    double? time,
    bool? isPlay,
    int? rounds,
    int? goal,
    String? currentMood,
  }) {
    return PomodoroModels(
      time: time ?? this.time,
      isPlay: isPlay ?? this.isPlay,
      rounds: rounds ?? this.rounds,
      goal: goal ?? this.goal,
      currentMood: currentMood ?? this.currentMood,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'isPlay': isPlay,
      'rounds': rounds,
      'goal': goal,
      'currentMood': currentMood,
    };
  }

  factory PomodoroModels.fromMap(Map<String, dynamic> map) {
    return PomodoroModels(
      time: map['time']?.toDouble() ?? 0.0,
      isPlay: map['isPlay'] ?? false,
      rounds: map['rounds']?.toInt() ?? 0,
      goal: map['goal']?.toInt() ?? 0,
      currentMood: map['currentMood'] ?? '',
    );
  }

  @override
  String toString() {
    return 'PomodoroModels(time: $time, isPlay: $isPlay, rounds: $rounds, goal: $goal, currentMood: $currentMood)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PomodoroModels &&
        other.time == time &&
        other.isPlay == isPlay &&
        other.rounds == rounds &&
        other.goal == goal &&
        other.currentMood == currentMood;
  }

  @override
  int get hashCode {
    return time.hashCode ^ isPlay.hashCode ^ rounds.hashCode ^ goal.hashCode ^ currentMood.hashCode;
  }
}
