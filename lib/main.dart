import 'package:flutter/material.dart';

import 'features/home/presentation/views/home_view.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Splash',
      home: SplashView(), // Set SplashScreen as the initial screen
    );
  }

  List<GoRoute> get appRoutes => [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
      routes: [GoRoute(path: 'home', builder: (context, state) => HomeView())],
    ),
  ];
}
