import 'package:creationcodes/core/constants/app_paddings.dart';
import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../widgets/category_cards_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: AppPaddings.horizontal,
        child: ListView(
          children: [
            const SizedBox(height: 60,),
            const Text("Creation Codes", style: AppTextStyles.header,),
            const SizedBox(height: 8,),
            const Text("Keşfetmeye başla!", style: AppTextStyles.subtitle,),
            const SizedBox(height: 32,),

            CategoryCard(
              title: "Model1",
              //imageAsset: "assets/icons/animal.png",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
