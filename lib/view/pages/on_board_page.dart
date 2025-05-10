import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/core/color_pallet.dart';
import 'package:my_todo_list/view/pages/bottom_nav_page.dart';
import 'package:my_todo_list/view/widgets/custom_onboard_page.dart';
import 'package:my_todo_list/view/widgets/on_board_skip_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardPage extends StatelessWidget {
  static const routeName = "/onBoardPage";
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();

    final customOnboardPages = [
      CustomOnboardPage(
        title: "Master Your Focus",
        description:
            "Track your progress in study, programming and exercise. Organize your tasks and achieve your goals",
        lottieAnimationPath: "assets/animations/study_trans.json",
      ),
      CustomOnboardPage(
        title: "Level Up Life",
        description:
            "Manage your study, programming projects, and exercise routines all in one place. Stay focused and stay healthy.",
        lottieAnimationPath: "assets/animations/running.json",
      ),
      CustomOnboardPage(
        title: "Code. Sweat. Learn",
        description:
            "Plan your study sessions, programming tasks, and workouts.  Your path to a more productive you.",
        lottieAnimationPath: "assets/animations/programming.json",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [OnboardSkipButton(), const SizedBox(width: 16)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 530,
              child: PageView(
                controller: pageController,
                children: customOnboardPages,
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: customOnboardPages.length,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorPallet.primaryThemeColor,
            foregroundColor: Colors.white,
            fixedSize: Size(MediaQuery.of(context).size.width * 55, 60),
            elevation: 5,
            shadowColor: Colors.greenAccent.shade200,
          ),
          onPressed: () {
            Get.toNamed(BottomNavigationPage.routeName);
          },
          child: Text("Get Started"),
        ),
      ),
    );
  }
}
