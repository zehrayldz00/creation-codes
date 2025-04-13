import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  //final String imageAsset;
  final VoidCallback onTap;

  const CategoryCard({super.key, required this.title,
    //required this.imageAsset,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              offset: const Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 1
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 10,
              spreadRadius: 1
            ),
          ],
        ),
        child: Row(
          children: [
            //Image.asset(imageAsset, height: 5,),
            //const SizedBox(width: 10,),
            Text(title, style: const TextStyle(fontSize: 18),)
          ],
        )
      ),
    );
  }
}
