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
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailPage(modelIDs: category.modelID) ));
      },
      child: Neumorphic(
         style: NeumorphicStyle(
           shape: NeumorphicShape.concave,
           color: AppColors.background,
           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
           depth: 8,
           lightSource: LightSource.topLeft,
         ),
          child: Column(
            children: [
              SizedBox(height: 8,),
              Expanded(
                flex: 1,
                child: Text(
                  category.title['en'] ?? "",
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex:3,
                child: Image.network(
                  category.imageUrl,
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
