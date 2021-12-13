import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admob_study/widgets/common.dart';

class RewardedAfterPage extends StatelessWidget {
  const RewardedAfterPage({Key? key}) : super(key: key);

  static String route = '/rewarded_after';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewarded After Page'),
      ),
      drawer: Common.drawer(context),
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: const Center(
          child: Text('Rewarded After.')
        )
      )
    );
  }
}