import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_admob_study/pages/banner_page.dart';
import 'package:flutter_admob_study/pages/interstitial_page.dart';
import 'package:flutter_admob_study/pages/rewarded_after_page.dart';
import 'package:flutter_admob_study/pages/rewarded_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterAdmobStudy',
      home: const BannerPage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        BannerPage.route: (BuildContext context) => const BannerPage(),
        InterstitialPage.route: (BuildContext context) => const InterstitialPage(),
        RewardedPage.route: (BuildContext context) => const RewardedPage(),
        RewardedAfterPage.route: (BuildContext context) => const RewardedAfterPage(),
      }
    );
  }
}
