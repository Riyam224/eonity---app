import 'package:dots_indicator/dots_indicator.dart';
import 'package:eonify/core/helper_functions/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper_functions/app_constants.dart';
import 'widgets/forget_pass_page_1.dart';
import 'widgets/forget_pass_page_2.dart';
import 'widgets/forget_pass_page_3.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  static const routeName = 'forget-password';

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kMainPadding24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              SizedBox(height: 32),
              Icon(Icons.arrow_back_ios_new_sharp),
              SizedBox(height: 32),
              Center(
                child: DotsIndicator(
                  dotsCount: 3,
                  position: currentPage.toDouble(), // 🚀 Smooth movement
                  decorator: DotsDecorator(
                    size: const Size(16, 6), // Custom shape (rounded rectangle)
                    activeSize: const Size(24, 8), // Larger active dot
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // Rounded corners
                    ),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        6,
                      ), // More rounded when active
                    ),
                    color: Colors.grey.shade400, // Inactive color
                    activeColor: AppColors.btnColor, // Active color
                  ),
                ),
              ),
              SizedBox(height: 60),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    ForgetPassPage1(),
                    ForgetPassPage2(),
                    ForgetPassPage3(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
