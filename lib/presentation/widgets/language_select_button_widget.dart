import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../views/language_selection/language_selection_menu_page.dart';

class LanguageSelectButton extends StatelessWidget {
  const LanguageSelectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LanguageSelectionMenuPage()),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.background),
      child: Icon(Icons.translate, color: AppColors.primaryText),
    );
  }
}
