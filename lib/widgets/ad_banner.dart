import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({required this.size, Key? key,}) : super(key: key);

  final AdSize size;
  @override
  Widget build(BuildContext context) {
    final _ad = BannerAd(
      size: size,
      adUnitId: adUnitId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          debugPrint('Ad loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          debugPrint('Ad failed to load: $error');
        },
        onAdOpened: (Ad ad) {
          debugPrint('Ad opened.');
        },
        onAdClosed: (Ad ad) {
          debugPrint('Ad closed.');
        },
      ),
      request: const AdRequest())
    ..load();

    return SizedBox(
      width: _ad.size.width.toDouble(),
      height: _ad.size.height.toDouble(),
      child: AdWidget(ad: _ad)
    );
  }

  static String get adUnitId {
    // if (Platform.isAndroid) {
    //   return '[android banner adUnitId]';
    // } else if (Platform.isIOS) {
    //   return '[ios banner adUnitId]';
    // } else {
      return BannerAd.testAdUnitId;
    // }
  }
}