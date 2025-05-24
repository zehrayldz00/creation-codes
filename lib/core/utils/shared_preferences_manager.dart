import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager{
  static const String _languageKey = 'selectedLanguage';
  static const String _onboardingKey = 'onboardingCompleted';

  static Future<void> saveLanguage(String languageCode) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }
  static Future<String?> getLanguage() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey);
  }
  Future<void> setOnboardingCompleted() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }
  Future<bool> getOnboardingCompleted() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingKey) ?? false;
  }
}