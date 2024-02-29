import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'app_cache.dart';

@immutable
class AppStartInit {
  const AppStartInit._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await AppCache.instance.setup();
    // await MobileAds.instance.initialize();
  }
}
