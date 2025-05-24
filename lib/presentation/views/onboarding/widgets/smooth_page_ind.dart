import 'package:creationcodes/presentation/viewmodels/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_colors.dart';

class SmoothPageInd extends StatelessWidget {
  const SmoothPageInd({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardingViewModel>(context);

    return Positioned(
      bottom: 120,
      left: 80,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: AppColors.activeDot, dotHeight: 6),
      ),
    );
  }
}