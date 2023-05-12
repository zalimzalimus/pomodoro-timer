import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:pomodoro_app/providers/pomodoro_notifier.dart';
import 'package:pomodoro_app/util/utils.dart';

class TimeOptions extends ConsumerStatefulWidget {
  const TimeOptions({super.key});

  @override
  ConsumerState<TimeOptions> createState() => _TimeOptionsState();
}

class _TimeOptionsState extends ConsumerState<TimeOptions> {
  @override
  Widget build(BuildContext context) {
    // var provider = ref.watch(timerProvider);
    var pomodoroController = ref.watch(pomodoroProvider);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 155),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableItems.map((time) {
          return InkWell(
            onTap: () {
              ref.read(pomodoroProvider.notifier).selectTime(double.parse(time));
              // setState(() {});
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: int.parse(time) == pomodoroController.time
                  ? BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 3,
                        color: Colors.purple.shade500,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )
                  : BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
              child: Center(
                child: Text(
                  (int.parse(time) ~/ 60).toString(),
                  style: context.textTheme.headlineSmall
                      ?.copyWith(color: int.parse(time) == pomodoroController.time ? Colors.black : Colors.white),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
