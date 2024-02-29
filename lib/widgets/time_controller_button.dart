import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro_app/providers/pomodoro_notifier.dart';

class TimeController extends ConsumerStatefulWidget {
  const TimeController({super.key});

  @override
  ConsumerState<TimeController> createState() => _TimeControllerState();
}

class _TimeControllerState extends ConsumerState<TimeController> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(pomodoroProvider.notifier);
    var isTimerPlaying = ref.watch(pomodoroProvider).isPlay;
    return Container(
        width: 100,
        height: 100,
        decoration:
            const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
        child: Center(
          child: IconButton(
            iconSize: 55,
            color: Colors.white,
            icon: isTimerPlaying
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow_outlined),
            onPressed: () {
              isTimerPlaying ? provider.pause() : provider.start();
            },
          ),
        ));
  }
}
