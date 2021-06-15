import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../state/user_state.dart';
import '../common/size_config.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final userC = Get.find<UserState>();
  bool _isSaved;

  @override
  void initState() {
    super.initState();
    tryGetData();
  }

  void tryGetData() async {
    _isSaved = await userC.getPref();
    Timer(Duration(seconds: 3), () {
      if (_isSaved) {
        Get.offNamed('/home');
      } else {
        Get.offNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/perikanan.png',
          height: (SizeConfig.safeBlockVertical * 32.52).roundToDouble(),
        ),
      ),
    );
  }
}
