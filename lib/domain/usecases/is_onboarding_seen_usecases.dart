import 'package:creationcodes/core/utils/shared_preferences_manager.dart';

class IsOnboardingSeenUseCase{
  Future<bool> call()async{
    return await SharedPreferencesManager.getOnboardingCompleted();
  }
}