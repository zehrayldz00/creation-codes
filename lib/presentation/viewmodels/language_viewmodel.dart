import 'package:creationcodes/core/utils/shared_preferences_manager.dart';
import 'package:flutter/material.dart';

class LanguageViewModel extends ChangeNotifier {
  String? _selectedLanguageCode;

  String? get selectedLanguageCode => _selectedLanguageCode;

  Future<void> loadLanguage() async{
    _selectedLanguageCode = await SharedPreferencesManager.getLanguage();
    notifyListeners();
  }

  Future<void> selectedLanguage(String code) async{
    _selectedLanguageCode = code;
    await SharedPreferencesManager.saveLanguage(code);
    notifyListeners();
  }
}