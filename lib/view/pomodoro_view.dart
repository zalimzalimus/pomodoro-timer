import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pomodoro_app/constant/app_strings.dart';
import 'package:pomodoro_app/providers/pomodoro_notifier.dart';
import 'package:pomodoro_app/util/ad_helper.dart';
import 'package:pomodoro_app/widgets/timer_card.dart';
import '../widgets/my_pomo_button.dart';
import '../widgets/time_options.dart';
import '../widgets/time_controller_button.dart';

class PomodoroScreen extends ConsumerStatefulWidget {
  const PomodoroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends ConsumerState<PomodoroScreen> {
  late BannerAd _bannerAd;
  // ignore: unused_field
  bool _isBottomBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    createBottomBannerAd();
  }

  void createBottomBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: AdHelper.bannerId,
        listener: BannerAdListener(onAdLoaded: (_) {
          setState(
            () {
              _isBottomBannerAdLoaded = true;
            },
          );
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }),
        request: const AdRequest());
    _bannerAd.load();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pomodoroController = ref.watch(pomodoroProvider.notifier);

    return Scaffold(
      bottomNavigationBar: _isBottomBannerAdLoaded
          ? SizedBox(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            )
          : null,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MyPomoButton(
                      label: PomodoroEnums.focus.name,
                      onPressed: () {
                        pomodoroController.focusMode();
                      },
                    ),
                    MyPomoButton(
                      label: PomodoroEnums.breaks.name,
                      onPressed: () {
                        pomodoroController.breakMode();
                      },
                    ),
                    MyPomoButton(
                      label: PomodoroEnums.longBreaks.name,
                      onPressed: () {
                        pomodoroController.longBreak();
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const TimerCard(),
                const SizedBox(
                  height: 20,
                ),
                const TimeOptions(),
                const SizedBox(
                  height: 20,
                ),
                const TimeController(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            ref.read(pomodoroProvider.notifier).reset();
          },
          icon: const Icon(Icons.refresh),
          color: Colors.black,
          iconSize: 20,
        ),
      ],
      title: Text(AppStrings.instance.appName),
      centerTitle: true,
    );
  }
}
