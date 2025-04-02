// ignore_for_file: unused_field, prefer_final_fields, unused_element, prefer_const_constructors_in_immutables, use_build_context_synchronously, avoid_print

import 'package:eonify/core/helper_functions/app_colors.dart';
import 'package:eonify/core/helper_functions/app_constants.dart';
import 'package:eonify/core/helper_functions/assets.dart';
import 'package:eonify/core/services/auth_service.dart';
import 'package:eonify/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:eonify/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:eonify/features/home/presentation/views/home_view.dart';
import 'package:eonify/r.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  SignUpView({super.key});

  static const routeName = 'sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  // ! parameters

  final FirebaseService _firebaseService = FirebaseService();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';
  bool _isChecked = false;

  // ! register user with email and password

  Future<void> _register() async {
    try {
      await _firebaseService.registerUser(
        _usernameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message!;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'An unexpected error occurred.';
      });
    }
  }

  // ! register with google

  Future<void> _registerWithGoogle() async {
    try {
      await _firebaseService.signInWithGoogle();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message!;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'An unexpected error occurred.';
      });
    }
  }

  // ! register with facebook
  Future<void> _registerWithFacebook() async {
    try {
      await _firebaseService.signInWithFacebook();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message!;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'An unexpected error occurred.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: kMainPadding24,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.iconBg,
                ),
                child: Image.asset(Assets.imagesOk, fit: BoxFit.fill),
              ),
              SizedBox(height: 30),
              Text(
                'Sign Up',
                style: TextStyle(
                  color: const Color(0xFF2A4ECA),
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
              kSizeBoxBetweenItems16,
              SizedBox(
                width: 345,
                child: Text(
                  'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF61677D),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 1.57,
                  ),
                ),
              ),
              kSizeBoxBetweenItems24,
              SizedBox(
                width: double.infinity,
                height: 56,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ! register with facebook
                    GestureDetector(
                      onTap: _registerWithFacebook,
                      child: Container(
                        width: 163,
                        height: 68,
                        color: Color(0xfff6f9fe),

                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AssetImages.facebook,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: 91,
                                child: Text(
                                  'Facebook',
                                  style: TextStyle(
                                    color: const Color(0xFF61677D),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 1.50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // ! register with google
                    GestureDetector(
                      onTap: _registerWithGoogle,
                      child: Container(
                        width: 163,
                        height: 68,
                        color: Color(0xfff6f9fe),

                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(AssetImages.google, fit: BoxFit.fill),
                              SizedBox(
                                width: 91,
                                child: Text(
                                  'Google',
                                  style: TextStyle(
                                    color: const Color(0xFF61677D),
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 1.50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kSizeBoxBetweenItems16,
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      thickness: 5.0, // Adjust the thickness as needed
                      color: Color(0xffe3e6ec), // , Optional: Change the color
                    ),
                    Text(
                      'Or',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF262626),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.57,
                      ),
                    ),
                    Divider(
                      thickness: 5.0, // Adjust the thickness as needed
                      color: Color(0xffe3e6ec), // , Optional: Change the color
                    ),
                  ],
                ),
              ),
              kSizeBoxBetweenItems16,
              CustomTextField(
                hintText: 'Name',
                controller: _usernameController,
              ),
              kSizeBoxBetweenItems16,
              CustomTextField(
                hintText: 'Email/Phone Number',
                controller: _emailController,
              ),
              kSizeBoxBetweenItems16,
              CustomTextField(
                hintText: 'Password',
                controller: _passwordController,
                icon: Icons.visibility_off,
              ),
              SizedBox(height: 30),

              Row(
                children: <Widget>[
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    // Use Expanded to allow text to wrap if needed.
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ), // Default text color
                        children: <TextSpan>[
                          TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(color: Colors.blue),
                            // Add onTap to navigate to Terms of Service
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to Terms of Service page.
                                    // Example: Navigator.pushNamed(context, '/terms');
                                    print(
                                      'Terms of Service tapped',
                                    ); //Replace with your actual logic
                                  },
                          ),
                          TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.blue),
                            // Add onTap to navigate to Privacy Policy
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to Privacy Policy page.
                                    // Example: Navigator.pushNamed(context, '/privacy');
                                    print(
                                      'Privacy Policy tapped',
                                    ); //Replace with your actual logic
                                  },
                          ),
                          TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              // ! register
              CustomAuthBtn(btnTitle: 'Sign up', onPressed: _register),
              // ! error message
              if (_errorMessage.isNotEmpty)
                Text(_errorMessage, style: TextStyle(color: Colors.red)),
              kSizeBoxBetweenItems16,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('sign-in');
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Do you have account? ',
                        style: TextStyle(
                          color: const Color(0xFF3A4053),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.57,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: const Color(0xFF3461FD),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 1.57,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 44),
            ],
          ),
        ),
      ),
    );
  }
}
