// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:eonify/core/helper_functions/app_colors.dart';
import 'package:eonify/core/helper_functions/app_constants.dart';
import 'package:eonify/core/helper_functions/assets.dart';
import 'package:eonify/core/services/shared_prefs_singleton.dart';
import 'package:eonify/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../../home/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  static const routeName = 'splash';

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2), // Adjust animation duration
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();

    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    bool hasSeenOnboarding = Prefs.getBool(KisOnboardingViewSeen);

    Timer(const Duration(seconds: 3), () {
      // Total splash duration
      if (hasSeenOnboarding) {
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  Assets.imagesLogo,
                  width: 200,
                  height: 200,
                ), // Adjust logo size
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Econify',
              style: TextStyle(
                color: AppColors.btnColor,
                fontSize: 32,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
