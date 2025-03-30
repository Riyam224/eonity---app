import 'package:eonify/core/helper_functions/app_routes.dart';
import 'package:eonify/core/services/shared_prefs_singleton.dart';
import 'package:eonify/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Splash',
      onGenerateRoute: onGenerateRoute,
      initialRoute: SignUpView.routeName,
    );
  }
}
