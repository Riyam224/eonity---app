import 'package:eonify/core/helper_functions/app_routes.dart';
import 'package:eonify/core/services/shared_prefs_singleton.dart';
import 'package:eonify/features/auth/presentation/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // todo shared prefs
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();

  // todo firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
