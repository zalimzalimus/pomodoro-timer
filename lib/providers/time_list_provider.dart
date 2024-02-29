import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../init/app_cache.dart';

final timeListProvider =
    StateNotifierProvider<TimeListNotifier, List<String>>((ref) {
  return TimeListNotifier();
});

class TimeListNotifier extends StateNotifier<List<String>> {
  TimeListNotifier()
      : super([
          "300",
          "600",
          "900",
          "1200",
          "1500",
          "1800",
          "2100",
          "2400",
          "2700",
          "3000",
        ]) {
    getData();
  }

  final defaultListItem = [
    "300",
    "600",
    "900",
    "1200",
    "1500",
    "1800",
    "2100",
    "2400",
    "2700",
    "3000",
  ];

  final prefs = AppCache.instance.sharedPreferences;
  final stringListKey = "stringListKey";

  void getData() {
    state = prefs.getStringList(stringListKey) ?? defaultListItem;
  }

  void addListitem(String time) {
    state = [...state, time];
    sortItem();
    prefs.setStringList(stringListKey, state);
  }

  void deleteListItem(String time) {
    state.remove(time);
    state = [...state];

    prefs.setStringList(stringListKey, state);
  }

  void sortItem() {
    state.sort((a, b) => int.parse(a).compareTo(int.parse(b)));
  }
}
