import 'package:creationcodes/core/services/language_service.dart';
import 'package:creationcodes/presentation/views/home/home_page.dart';
import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatelessWidget {
  LanguageSelectionPage({super.key});

  final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'tr', 'name': 'Türkçe'},
  ];

  void _onLanguageSelected(BuildContext context, String code) async {
    final languageService = await LanguageService.getInstance();
    await languageService.setLanguage(code);

    if (context.mounted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Language Screen"),),
      body: ListView.builder(
        itemCount: languages.length,
          itemBuilder: (context, index){
          final language = languages[index];
          return ListTile(
            title: Text(language['name']!),
            onTap: () => _onLanguageSelected(context, language['code']!),
          );
          }
      ),
    );
  }
}
