import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:pomodoro_app/providers/pomodoro_notifier.dart';

class TimerCard extends ConsumerStatefulWidget {
  const TimerCard({Key? key}) : super(key: key);

  @override
  ConsumerState<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends ConsumerState<TimerCard> {
  @override
  Widget build(BuildContext context) {
    // var timerState = ref.watch(timerProvider);
    var pomodoroState = ref.watch(pomodoroProvider);

    var seconds = ref.watch(pomodoroProvider).time % 60;
    return Column(
      children: <Widget>[
        Text(
          pomodoroState.currentMood,
          style: context.general.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  (pomodoroState.time ~/ 60).toString(),
                  style: context.general.textTheme.headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 70),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ':',
              style: context.general.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  seconds == 0
                      ? '${seconds.round()}0'
                      : seconds.round().toString(),
                  style: context.general.textTheme.headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 70),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
