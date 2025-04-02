// ignore_for_file: unused_field, unused_local_variable, use_build_context_synchronously

import 'package:eonify/core/services/auth_service.dart';
import 'package:eonify/features/auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  static const routeName = 'home';
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    // ! user
    final user = _firebaseService.getCurrentUser();
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (user != null)
              Column(
                children: [
                  Text(
                    'Welcome, ${user.displayName ?? user.email}!',
                  ), // Display username or email
                  SizedBox(height: 20),
                  // ! when click sign out
                  ElevatedButton(
                    onPressed: () async {
                      await _firebaseService.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInView(),
                        ), // Replace SignInPage with your sign-in page
                      );
                    },
                    child: Text('Sign Out'),
                  ),
                ],
              )
            else
              Text('You are not signed in.'),
          ],
        ),
      ),
    );
  }
}
