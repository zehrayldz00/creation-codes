import 'package:cached_network_image/cached_network_image.dart';
import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:creationcodes/presentation/views/category_detail/category_detail_page.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../core/utils/neumorphic_styles.dart';
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
         style: NeumorphicStyles.defaultCard,
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
                child: CachedNetworkImage(
                  imageUrl : category.imageUrl,
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

