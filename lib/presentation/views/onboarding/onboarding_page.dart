import 'package:creationcodes/core/constants/onboarding_strings.dart';
import 'package:creationcodes/presentation/viewmodels/language_viewmodel.dart';
import 'package:creationcodes/presentation/viewmodels/onboarding_viewmodel.dart';
import 'package:creationcodes/presentation/views/onboarding/widgets/smooth_page_ind.dart';
import 'package:creationcodes/presentation/views/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/image_strings.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardingViewModel>(context);
    final languageCode = context.watch<LanguageViewModel>().selectedLanguageCode ?? 'en';

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              Onboarding(
                image: ImageStrings.onboarding1,
                description: OnboardingStrings.onboardingStrings[languageCode]?[0]  ?? '',
              ),
              Onboarding(
                image: ImageStrings.onboarding2,
                description: OnboardingStrings.onboardingStrings[languageCode]?[1]  ?? '',
              ),
              Onboarding(
                image: ImageStrings.onboarding3,
                description: OnboardingStrings.onboardingStrings[languageCode]?[2]  ?? '',
              ),
            ],
          ),

          // Skip Button:
          SkipButton(),

          // Smooth Page Indicator:
          SmoothPageInd(),

          // Circular Button:
          NextButton(),

          /*IconButton(
            onPressed: () async {
              final navigator = Navigator.of(context);
              await Provider.of<OnboardingViewModel>(
                context,
                listen: false,
              ).completeOnboarding();
              navigator.pushReplacement(
                MaterialPageRoute(builder: (_) => SplashPage()),
              );
            },
            icon: Icon(Icons.start_rounded),
          ),*/
        ],
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100,
      right: 30,
      child: ElevatedButton(
        onPressed: () => Provider.of<OnboardingViewModel>(context, listen: false).nextPage(context),
        style : ElevatedButton.styleFrom(shape: CircleBorder() ,backgroundColor : AppColors.activeDot),
        child: Icon(Icons.arrow_right),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      right: 30,
      child: TextButton(
        onPressed: () async {
          final navigator = Navigator.of(context);
          await Provider.of<OnboardingViewModel>(
            context,
            listen: false,
          ).completeOnboarding();
          navigator.pushReplacement(
            MaterialPageRoute(builder: (_) => SplashPage()),
          );
        },
        child: const Text("Skip"),
      ),
    );
  }
}

class Onboarding extends StatelessWidget {
  const Onboarding({super.key, required this.image, required this.description});

  final String image, description;

  @override
  Widget build(BuildContext context) {
    late double screenw = MediaQuery.of(context).size.width;
    late double screenh = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.only(top:90, left: 8.0, right: 8.0),
      child: Column(
        children: [
          Flexible(
            flex: 3,
            child: Image(
              width: screenw*0.8,
              height: screenh*0.8,
              image: AssetImage(image),
            ),
          ),
          Flexible(flex:2, child: Text(description)),
          SizedBox(height: 60,)
        ],
      ),
    );
  }
}
