import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:creationcodes/presentation/views/category_detail/category_detail_page.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import '../../domain/entities/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({super.key,
    required this.category,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailPage() ));
      },
      child: Neumorphic(
         style: NeumorphicStyle(
           shape: NeumorphicShape.concave,
           color: AppColors.background,
           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
           depth: 8,
           lightSource: LightSource.topLeft,
         ),
    /*child: Container(
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
          padding: AppPaddings.all,*/
          child: Column(
            children: [
              SizedBox(height: 8,),
              Expanded(
                flex: 1,
                child: Text(
                  category.title['en'] ?? "",
                  //category.title,
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex:3,
                child: Image.network(
                  category.imageUrl,
                  //category.imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 5,)
            ],
          //)
        ),
      ),
    );
  }
}
