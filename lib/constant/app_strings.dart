class AppStrings {
  AppStrings._init();
  static AppStrings? _instance;
  // ignore: prefer_constructors_over_static_methods
  static AppStrings get instance {
    _instance ??= AppStrings._init();
    return _instance!;
  }

  final String appName = "Jasmin Academy Pomodoro";
  final String addMinute = "Dakika ekle";
  final String add = "Ekle";
  final String addMinuteErrorText = "Dakika bölümü boş bırakılamaz!";
  final String areYouSureDelete = "Silmek istediğinizden emin misiniz?";
  final String delete = "Sil";
  final String cancel = "İptal";
}
