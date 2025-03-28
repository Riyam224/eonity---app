import 'package:eonify/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/onBoarding/presentation/views/on_boarding_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'splash':
      return MaterialPageRoute(builder: (_) => SplashView());
    case 'home':
      return MaterialPageRoute(builder: (_) => HomeView());
    case 'onBoarding':
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
