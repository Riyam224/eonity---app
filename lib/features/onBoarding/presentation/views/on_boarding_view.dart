import 'package:dots_indicator/dots_indicator.dart';
import 'package:eonify/core/helper_functions/app_colors.dart';
import 'package:eonify/core/helper_functions/app_constants.dart';
import 'package:eonify/core/services/shared_prefs_singleton.dart';
import 'package:eonify/features/home/presentation/views/home_view.dart';
import 'package:eonify/features/onBoarding/presentation/views/widgets/custom_onboarding_btn.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper_functions/assets.dart';
import 'widgets/page_view_item.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const routeName = 'onBoarding';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
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
      backgroundColor: AppColors.splashColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                PageViewItem(
                  image: Assets.imagesSaly22,
                  smallImg: Assets.imagesOk,
                  title: 'The Simple Way to',
                  subtitle: 'find the best!',
                  description:
                      'Aenean eu lacinia ligula. Quisque eu risus erat. Aenean placerat sollicitudin lectus.',
                ),
                PageViewItem(
                  image: Assets.imagesSaly27,
                  smallImg: Assets.imagesHandHoldingPencilRight,
                  title: 'The Best Design',
                  subtitle: 'Strategy!',
                  description:
                      'Aenean eu lacinia ligula. Quisque eu risus erat. Aenean placerat sollicitudin lectus.',
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 23, bottom: 101),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // todo
                CustomOnboardingBtn(
                  onPressed: () {
                    Prefs.setBool(KisOnboardingViewSeen, true);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  },
                  btnText: 'Skip',
                ),
                DotsIndicator(
                  dotsCount: 2,
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
                // todo
                CustomOnboardingBtn(
                  onPressed: () {
                    if (currentPage == 2 - 1) {
                      // Navigate to HomeView when on the last page
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    } else {
                      // Move to the next page if not on the last page
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  btnText: 'Next',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
