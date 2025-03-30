import 'package:eonify/core/helper_functions/app_colors.dart';
import 'package:eonify/core/helper_functions/app_constants.dart';
import 'package:eonify/core/helper_functions/assets.dart';
import 'package:eonify/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:eonify/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:eonify/r.dart';
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

  bool _isChecked = false;

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
                    Container(
                      width: 163,
                      height: 68,
                      color: Color(0xfff6f9fe),

                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(AssetImages.facebook, fit: BoxFit.fill),
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
                    Container(
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
              CustomTextField(hintText: 'Name'),
              kSizeBoxBetweenItems16,
              CustomTextField(hintText: 'Email/Phone Number'),
              kSizeBoxBetweenItems16,
              CustomTextField(hintText: 'Password', icon: Icons.visibility_off),
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
              CustomAuthBtn(btnTitle: 'Sign up', onPressed: () {}),
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
