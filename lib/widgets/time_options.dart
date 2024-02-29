import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:pomodoro_app/constant/app_strings.dart';
import 'package:pomodoro_app/providers/pomodoro_notifier.dart';
import 'package:pomodoro_app/providers/time_list_provider.dart';

class TimeOptions extends ConsumerStatefulWidget {
  const TimeOptions({super.key});

  @override
  ConsumerState<TimeOptions> createState() => _TimeOptionsState();
}

class _TimeOptionsState extends ConsumerState<TimeOptions> {
  @override
  Widget build(BuildContext context) {
    // var provider = ref.watch(timerProvider);
    var timeList = ref.watch(timeListProvider);
    var pomodoroController = ref.watch(pomodoroProvider);
    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: 155),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: timeList.map((time) {
          return InkWell(
            onLongPress: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(AppStrings.instance.cancel),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(timeListProvider.notifier)
                                  .deleteListItem(time);
                              Navigator.pop(context);
                            },
                            child: Text(AppStrings.instance.delete),
                          ),
                        ],
                        title: Text(AppStrings.instance.areYouSureDelete),
                      ));
            },
            onTap: () {
              ref
                  .read(pomodoroProvider.notifier)
                  .selectTime(double.parse(time.toString()));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              width: 70,
              height: 50,
              decoration: int.parse(time.toString()) == pomodoroController.time
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
                  style: context.general.textTheme.headlineSmall?.copyWith(
                      color:
                          int.parse(time.toString()) == pomodoroController.time
                              ? Colors.black
                              : Colors.white),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
