import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_study/pages/rewarded_after_page.dart';
import 'package:flutter_admob_study/widgets/common.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const maxFailedLoadAttempts = 3;

class RewardedPage extends StatefulWidget {
  const RewardedPage({Key? key}) : super(key: key);

  static String route = '/rewarded';

  @override
  _RewardedPageState createState() => _RewardedPageState();
}

class _RewardedPageState extends State<RewardedPage> {

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  static String get adUnitId {
    // if (Platform.isAndroid) {
    //   return '[android Reward adUnitId]';
    // } else if (Platform.isIOS) {
    //   return '[ios Reward adUnitId]';
    // } else {
      return RewardedAd.testAdUnitId;
    // }
  }

  @override
  void initState() {
    super.initState();
    _createRewardedAd();
  }

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          debugPrint('$ad loaded.');
          _rewardedAd = ad;
          _numRewardedLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('RewardedAd failed to load: $error');
          _rewardedAd = null;
          _numRewardedLoadAttempts += 1;
          if (_numRewardedLoadAttempts <= maxFailedLoadAttempts) {
            _createRewardedAd();
          }
        },
      )
    );
  }

  void _showRewardedAd(BuildContext context) {
    if (_rewardedAd == null) {
      debugPrint('Warning: attempt to show Reward before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) {
        debugPrint('$ad onAdShowedFullScreenContent.');
      },
      onAdImpression: (RewardedAd ad) {
        debugPrint('$ad onAdImpression.');
      },
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        debugPrint('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem reward) {
      debugPrint('$ad with reward $RewardItem(${reward.amount}, ${reward.type}');
      // リワード広告が最後まで表示されたあとに遷移
      Navigator.of(context).pushReplacementNamed(RewardedAfterPage.route);
    });
    _rewardedAd = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewarded Ad Test'),
      ),
      drawer: Common.drawer(context),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: Center(
          child: ElevatedButton(
            child: const Text('showRewardedAd'),
            onPressed: () {
              _showRewardedAd(context);
            },
          ),
        )
      )
    );
  }
}