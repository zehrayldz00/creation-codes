//import 'package:flutter/material.dart';
import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:creationcodes/presentation/views/home/home_page.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/language_codes.dart';
import '../../viewmodels/language_viewmodel.dart';

class LanguageSelectionMenuPage extends StatefulWidget {
  const LanguageSelectionMenuPage({super.key});

  @override
  State<LanguageSelectionMenuPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionMenuPage> {
  final languages = LanguageCodes.languages;

  /*void _onLanguageSelected(BuildContext context, String code ) async {
    await context.read<LanguageViewModel>().selectedLanguage(code);
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

  }*/

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LanguageViewModel>();

    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: Text("Select Language", style: AppTextStyles.header), leading: Icon(Icons.translate), centerTitle: true, backgroundColor: AppColors.background,),
        body: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index){
            final language = languages[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 20, left: 20),
              child: Neumorphic(
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 3,
                  color: AppColors.background,
                ),
                child: ListTile(
                    title: Text(language['name']!, textAlign: TextAlign.center, style: AppTextStyles.subtitle,),
                    onTap: () {
                      vm.selectedLanguage(language['code']!);
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }

                    }
                ),
              ),
            );
          },
        ),
    );
  }
}
