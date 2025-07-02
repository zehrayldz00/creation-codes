import '../../core/utils/shared_preferences_manager.dart';

class SetOnboardingSeenUseCase{

  Future<void> call(){
    return SharedPreferencesManager.setOnboardingCompleted();
  }
}