import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:creationcodes/presentation/views/category_detail/category_detail_page.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/entities/category.dart';
import '../viewmodels/language_viewmodel.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    final languageCode = context.watch<LanguageViewModel>().selectedLanguageCode ?? 'en';

    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetailPage(modelIDs: category.modelID) ));
      },
      child: Neumorphic(
         style: NeumorphicStyle(
           shape: NeumorphicShape.concave,
           boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
           depth: 3,
           lightSource: LightSource.topLeft,
           color: AppColors.background
         ),
          child: Column(
            children: [
              SizedBox(height: 25,),
              Text(
                category.title[languageCode] ?? '',
                style: AppTextStyles.subtitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              Expanded(
                flex:3,
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 25,)
            ],
          //)
        ),
      ),
    );
  }
}

