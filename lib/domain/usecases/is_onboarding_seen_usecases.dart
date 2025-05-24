import 'package:creationcodes/core/utils/shared_preferences_manager.dart';

class IsOnboardingSeenUseCase{
  final SharedPreferencesManager helper;

  IsOnboardingSeenUseCase(this.helper);

  Future<bool> call(){
    return helper.getOnboardingCompleted();
  }
}