import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const String _languageCodeKey = 'selected_language_code';
  static LanguageService? _instance;
  late SharedPreferences _prefs;

  String? _selectedLanguageCode;

  // Singleton: uygulama boyunca tek bir LanguageService nesnesi olacak.
  LanguageService._internal();

  static Future<LanguageService> getInstance() async {
    if (_instance == null) {
      _instance = LanguageService._internal();
      await _instance!._initPrefs();
    }
    return _instance!;
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _selectedLanguageCode =
        _prefs.getString(_languageCodeKey) ?? 'en'; //varsayılan ingilizce
  }

  // Şu anki seçili dil kodunu getirir.
  String? get selectedLanguageCode => _selectedLanguageCode;

  // Dil kodunu değiştirir ve kaydeder.
  Future<void> setLanguage(String languageCode) async {
    _selectedLanguageCode = languageCode;
    await _prefs.setString(_languageCodeKey, languageCode);
  }

  bool isLanguageSelected (){
    return _selectedLanguageCode != null && _selectedLanguageCode!.isNotEmpty;
  }

  /*
  // Dil seçimini temizler (opsiyonel)
  Future<void> clearLanguage() async {
    _selectedLanguageCode = null;
    await _prefs.remove(_languageCodeKey);
  }*/
}
