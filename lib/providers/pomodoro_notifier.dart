import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_app/models/pomodoro_models.dart';

final pomodoroProvider = StateNotifierProvider<PomodoroNotifier, PomodoroModels>((ref) {
  return PomodoroNotifier();
});

class PomodoroNotifier extends StateNotifier<PomodoroModels> {
  PomodoroNotifier()
      : super(
          PomodoroModels(
            time: 1500,
            isPlay: false,
            rounds: 0,
            goal: 0,
            currentMood: PomodoroEnums.focus.name,
          ),
        );

  Timer? timer;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  void start() {
    clickButton();
    state = state.copyWith(isPlay: true);
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        state = state.copyWith(time: state.time - 1);
        if (state.time <= 0) {
          playAlarm();
          pause();
          state = state.copyWith(time: 300);
        }
      },
    );
  }

  Future<void> clickButton() async {
    assetsAudioPlayer.open(Audio('assets/sounds/click_button.mp3'));
  }

  Future<void> playAlarm() async {
    assetsAudioPlayer.open(Audio('assets/sounds/alert_sound.mp3'));
  }

  void focusMode() {
    state = state.copyWith(
      currentMood: PomodoroEnums.focus.name,
      time: 1500,
    );
  }

  void breakMode() {
    state = state.copyWith(
      currentMood: PomodoroEnums.breaks.name,
      time: 300,
    );
  }

  void longBreak() {
    state = state.copyWith(
      currentMood: PomodoroEnums.longBreaks.name,
      time: 900,
    );
  }

  void pause() {
    clickButton();
    timer?.cancel();
    state = state.copyWith(isPlay: false);
    // isTimerPlaying = true;
  }

  void reset() {
    state = state.copyWith(time: 1500);
  }

  void selectTime(double seconds) {
    state = state.copyWith(time: seconds);
  }

  void handleNextRound() {
    var currentMood = state.currentMood;
    var rounds = state.rounds;
    var goal = state.goal;

    if (currentMood == "FOCUS") {
      state = state.copyWith(
        currentMood: "BREAK",
        time: 300,
        rounds: rounds + 1,
        goal: goal + 1,
      );
    } else if (currentMood == "BREAK") {
      state = state.copyWith(
        currentMood: "FOCUS",
        time: 1500,
      );
    } else if (currentMood == "FOCUS" && rounds == 3) {
      state = state.copyWith(
        currentMood: "LONG BREAK",
        time: 1500,
        rounds: rounds + 1,
        goal: goal + 1,
      );
    } else if (currentMood == "LONG BREAK") {
      state = state.copyWith(
        currentMood: "FOCUS",
        time: 1500,
      );
    }
  }
}

enum PomodoroEnums {
  focus,
  breaks,
  longBreaks;
}

extension PomodoroEnumExtension on PomodoroEnums {
  String get name {
    switch (this) {
      case PomodoroEnums.focus:
        return 'FOCUS';
      case PomodoroEnums.breaks:
        return 'BREAK';
      case PomodoroEnums.longBreaks:
        return 'LONG BREAK';
      default:
        return '';
    }
  }
}
