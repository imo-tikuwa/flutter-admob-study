import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_study/widgets/common.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_admob_study/widgets/ad_banner.dart';

class BannerPage extends StatelessWidget {
  const BannerPage({Key? key}) : super(key: key);

  static String route = '/banner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner Ad Test'),
      ),
      // フッター固定で広告表示
      bottomNavigationBar: const AdBanner(size: AdSize.fullBanner),
      drawer: Common.drawer(context),
      body: Container(
        alignment: AlignmentDirectional.center,
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: AdSize.largeBanner.height.toDouble(),
                width: AdSize.largeBanner.width.toDouble(),
                child: const Center(child: Text('box1')),
                color: Colors.red[50],
              ),
              Container(
                height: AdSize.largeBanner.height.toDouble(),
                width: AdSize.largeBanner.width.toDouble(),
                child: const Center(child: Text('box2')),
                color: Colors.green[50]
              ),
              Container(
                height: AdSize.largeBanner.height.toDouble(),
                width: AdSize.largeBanner.width.toDouble(),
                child: const Center(child: Text('box3')),
                color: Colors.blue[50]
              ),
              Container(
                height: AdSize.largeBanner.height.toDouble(),
                width: AdSize.largeBanner.width.toDouble(),
                child: const Center(child: Text('box4')),
                color: Colors.red[50],
              ),
              Container(
                height: AdSize.largeBanner.height.toDouble(),
                width: AdSize.largeBanner.width.toDouble(),
                child: const Center(child: Text('box5')),
                color: Colors.green[50]
              ),
              // 任意の箇所に広告表示
              const AdBanner(size: AdSize.largeBanner),
              Container(
                height: AdSize.largeBanner.height.toDouble(),
                width: AdSize.largeBanner.width.toDouble(),
                child: const Center(child: Text('box6')),
                color: Colors.blue[50]
              ),
              Container(
                height: AdSize.largeBanner.height.toDouble(),
                width: AdSize.largeBanner.width.toDouble(),
                child: const Center(child: Text('box7')),
                color: Colors.red[50],
              ),
              Container(
                height: AdSize.largeBanner.height.toDouble(),
                width: AdSize.largeBanner.width.toDouble(),
                child: const Center(child: Text('box8')),
                color: Colors.green[50]
              ),
              Container(
                height: AdSize.largeBanner.height.toDouble(),
                width: AdSize.largeBanner.width.toDouble(),
                child: const Center(child: Text('box9')),
                color: Colors.blue[50]
              ),
            ]
          ),
        ),
      )
    );
  }
}