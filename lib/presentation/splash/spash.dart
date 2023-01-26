import 'dart:async';

import 'package:adv_app/presentation/resources/assets_management.dart';
import 'package:adv_app/presentation/resources/color_management.dart';
import 'package:adv_app/presentation/resources/route_management.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  SplashView({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  Timer? timer;
  _startDelay() {
    timer = Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, Routes.onBoardingRoute),
    );
    setState(() {});
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManagement.primary,
      body:
          const Center(child: Image(image: AssetImage(AssetsImage.splashLogo))),
    );
  }
}
