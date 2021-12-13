import 'package:flutter/material.dart';
import 'package:flutter_admob_study/pages/banner_page.dart';
import 'package:flutter_admob_study/pages/interstitial_page.dart';
import 'package:flutter_admob_study/pages/rewarded_page.dart';

class Common {

  // 全画面で共通のドロワーを表示
  static Drawer drawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'FlutterAdMobStudy',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: const Text('バナー広告'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(BannerPage.route);
            },
          ),
          ListTile(
            title: const Text('インタースティシャル広告'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(InterstitialPage.route);
            },
          ),
          ListTile(
            title: const Text('リワード広告'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(RewardedPage.route);
            },
          ),
        ],
      ),
    );
  }
}