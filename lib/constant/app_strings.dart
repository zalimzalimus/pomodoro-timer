class AppStrings {
  AppStrings._init();
  static AppStrings? _instance;
  // ignore: prefer_constructors_over_static_methods
  static AppStrings get instance {
    _instance ??= AppStrings._init();
    return _instance!;
  }

  final String appName = "Pomodoro Time Pro";
}
