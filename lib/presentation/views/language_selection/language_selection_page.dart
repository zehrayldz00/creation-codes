import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:creationcodes/presentation/viewmodels/onboarding_viewmodel.dart';
import 'package:creationcodes/presentation/views/onboarding/onboarding_page.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/language_codes.dart';
import '../../../core/utils/neumorphic_styles.dart';
import '../../viewmodels/language_viewmodel.dart';
import '../home/home_page.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  final languages = LanguageCodes.languages;

  void _onLanguageSelected(BuildContext context, String code ) async {
    final isOnboardingSeen = Provider.of<OnboardingViewModel>(context, listen:false).isOnboardingSeen ;
    await context.read<LanguageViewModel>().selectedLanguage(code);

    if (context.mounted) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  isOnboardingSeen ? HomePage() : OnboardingPage()),
    );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  style: NeumorphicStyles.defaultCard,
                  child: ListTile(
                    title: Text(language['name']!, textAlign: TextAlign.center, style: AppTextStyles.subtitle,),
                    onTap: () {
                    _onLanguageSelected(context, language['code']!);
                    }
                  ),
                ),
              );
              },
          ),
    );
  }
}
