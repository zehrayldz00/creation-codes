import 'package:creationcodes/domain/usecases/is_onboarding_seen_usecases.dart';
import 'package:creationcodes/domain/usecases/set_onboarding_seen_usecases.dart';
import 'package:creationcodes/presentation/views/splash/splash_page.dart';
import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier{
  final IsOnboardingSeenUseCase isSeenUseCase;
  final SetOnboardingSeenUseCase setSeenUseCase;

  final pageController = PageController();

  int currentPageIndex = 0;

  bool? _isOnboardingSeen;
  bool? get isOnboardingSeen => _isOnboardingSeen;

  OnboardingViewModel({
    required this.isSeenUseCase,
    required this.setSeenUseCase
  });

  Future<void> checkOnboardingStatus() async{
    _isOnboardingSeen = await isSeenUseCase();
    notifyListeners();
  }

  Future<void> completeOnboarding()async{
    await setSeenUseCase();
    _isOnboardingSeen = true;
    notifyListeners();
  }

  // Update current index when page changes:
  void updatePageIndicator(index) => currentPageIndex = index;

  // Jump to the specific dot selected page:
  void dotNavigationClick(index){
    currentPageIndex = index;
    pageController.jumpToPage(index);
  }

  // Update current index & jump to next page:
  void nextPage(context){
    if(currentPageIndex == 2){
      completeOnboarding();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashPage()));

    } else{
      int page = currentPageIndex + 1;
      pageController.jumpToPage(page);
    }
  }
}