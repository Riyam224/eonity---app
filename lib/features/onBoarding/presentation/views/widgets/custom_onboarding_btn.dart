import 'package:flutter/material.dart';

class CustomOnboardingBtn extends StatelessWidget {
  const CustomOnboardingBtn({super.key, this.onPressed, required this.btnText});
  final void Function()? onPressed;
  final String btnText;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        btnText,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: const Color(0xFFC7D2DE),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 1.50,
        ),
      ),
    );
  }
}
