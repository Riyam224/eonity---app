// ignore_for_file: sized_box_for_whitespace

import 'package:eonify/core/helper_functions/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/app_colors.dart';
import '../../../../../r.dart';
import 'custom_auth_button.dart';

class ForgetPassPage2 extends StatelessWidget {
  const ForgetPassPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,

      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.iconBg,
              ),
              child: Image.asset(AssetImages.message, fit: BoxFit.cover),
            ),
            kSizeBoxBetweenItems16,
            Text(
              'Enter OTP',
              style: TextStyle(
                color: const Color(0xFF2A4ECA),
                fontSize: 32,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
            kSizeBoxbetweenItems32,
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
            kSizeBoxbetweenItems32,

            Row(
              // Use Row to arrange containers horizontally
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Distribute space evenly
              children: List.generate(
                5, // Create 5 containers
                (index) => Container(
                  width: 56,
                  height: 70,
                  decoration: ShapeDecoration(
                    color: AppColors.iconBg,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: const Color(0xFFEAEFF5),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 52),
            CustomAuthBtn(btnTitle: 'Continue', onPressed: () {}),
            kSizeBoxBetweenItems16,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Didn’t get OTP? ',
                    style: TextStyle(
                      color: const Color(0xFF3A4053),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 1.57,
                    ),
                  ),
                  TextSpan(
                    text: 'Resend OTP',
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
          ],
        ),
      ),
    );
  }
}
