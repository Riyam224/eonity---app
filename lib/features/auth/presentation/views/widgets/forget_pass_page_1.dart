// ignore_for_file: sized_box_for_whitespace

import 'package:eonify/core/helper_functions/app_constants.dart';
import 'package:eonify/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/app_colors.dart';
import '../../../../../r.dart';
import 'custom_auth_button.dart';

class ForgetPassPage1 extends StatelessWidget {
  const ForgetPassPage1({super.key});

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
              'Forget Password',
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
            CustomTextField(hintText: 'Email I’D/ Mobile Number'),
            kSizeBoxbetweenItems32,
            CustomAuthBtn(btnTitle: 'Continue', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
