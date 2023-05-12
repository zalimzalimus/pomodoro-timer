class AppStrings {
  AppStrings._init();
  static AppStrings? _instance;
  // ignore: prefer_constructors_over_static_methods
  static AppStrings get instance {
    _instance ??= AppStrings._init();
    return _instance!;
  }

  final String appName = "Pomodoro Time Pro";
  final String addMinute = "Add minute";
  final String add = "Add";
  final String addMinuteErrorText = "The minute section cannot be left blank";
  final String areYouSureDelete = "Are you sure you want to delete?";
  final String delete = "Delete";
  final String cancel = "Cancel";
}
