import '../../core/utils/shared_preferences_manager.dart';

class SetOnboardingSeenUseCase{
  final SharedPreferencesManager helper;

  SetOnboardingSeenUseCase(this.helper);

  Future<void> call(){
    return helper.setOnboardingCompleted();
  }
}