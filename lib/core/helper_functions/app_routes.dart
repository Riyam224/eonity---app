import 'package:eonify/features/auth/presentation/views/sign_in_view.dart';
import 'package:eonify/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/forget_password_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
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

    //  ! todo auth routes
    case 'sign-up':
      return MaterialPageRoute(builder: (_) => SignUpView());
    case 'sign-in':
      return MaterialPageRoute(builder: (_) => SignInView());
    case 'forget-password':
      return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
