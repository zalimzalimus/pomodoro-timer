import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro_app/view/pomodoro_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: Colors.redAccent,
        textTheme: const TextTheme(
            headlineMedium: TextStyle(color: Colors.black),
            headlineSmall: TextStyle(color: Colors.black),
            headlineLarge: TextStyle(color: Colors.black)),
      ),
      title: 'Pomodoro Timers',
      home: const PomodoroScreen(),
    );
  }
}
