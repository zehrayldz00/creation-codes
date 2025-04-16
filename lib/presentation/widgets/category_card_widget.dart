import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:creationcodes/core/constants/app_paddings.dart';
import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../data/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryCard({super.key,
    required this.category,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              offset: const Offset(-4, 4),
              blurRadius: 1,
              spreadRadius: 1
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(4, -4),
              blurRadius: 5,
              spreadRadius: 1
            ),
          ],
        ),
        padding: AppPaddings.all,
        child: Column(
          children: [
            SizedBox(height: 8,),
            Expanded(
              flex: 1,
              child: Text(
                category.title,
                style: AppTextStyles.subtitle,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex:3,
              child: Image.asset(
                category.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 5,)
          ],
        )
      ),
    );
  }
}
