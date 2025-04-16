import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:creationcodes/core/constants/app_paddings.dart';
import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:creationcodes/data/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/category_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<CategoryModel> categories = const[
    CategoryModel(title: 'Biyoloji', imagePath: "assets/bio.png"),
    CategoryModel(title: 'Biyoloji', imagePath: "assets/bio.png"),
    CategoryModel(title: 'Biyoloji', imagePath: "assets/bio.png"),
    CategoryModel(title: 'Biyoloji', imagePath: "assets/bio.png"),
    CategoryModel(title: 'Biyoloji', imagePath: "assets/bio.png"),
    CategoryModel(title: 'Biyoloji', imagePath: "assets/bio.png"),
    CategoryModel(title: 'Biyoloji', imagePath: "assets/bio.png"),
    CategoryModel(title: 'Biyoloji', imagePath: "assets/bio.png"),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
          padding: AppPaddings.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60,),
            const Text("Creation Codes", style: AppTextStyles.header,),
            const SizedBox(height: 8,),
            const Text("Keşfetmeye başla!", style: AppTextStyles.subtitle,),
            const SizedBox(height: 32,),

            Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //ikişerli
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 3 / 4,
                    ),
                    itemBuilder: (context, index){
                    final category = categories[index];
                    return CategoryCard(
                        category: category,
                        onTap: (){}
                    );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
