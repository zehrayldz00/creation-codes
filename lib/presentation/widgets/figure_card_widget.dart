import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:creationcodes/presentation/viewmodels/language_viewmodel.dart';
import 'package:creationcodes/presentation/views/model/model_page.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../domain/entities/figure.dart';

class FigureCardWidget extends StatelessWidget {
  final Figure figure;
  final VoidCallback onTap;

  const FigureCardWidget({
    super.key,
    required this.figure,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final languageCode = context.watch<LanguageViewModel>().selectedLanguageCode ?? 'en';

    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder : (context) => ModelPage(
        modelPath: figure.modelUrl,
        title: figure.title[languageCode] ?? '',
        ayet: figure.ayet[languageCode] ?? '',
        description: figure.description[languageCode] ?? '',
      )));},
      child: Neumorphic(
        style: NeumorphicStyle(
          shape : NeumorphicShape.concave,
          color: AppColors.background,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 8,
          lightSource: LightSource.topLeft,
        ),
        child: Column(
          children: [
            SizedBox(height: 25,),
            Expanded(
              flex: 2,
                child: Text(
                  figure.title[languageCode] ?? "",
                  style: AppTextStyles.subtitle,
                  textAlign: TextAlign.center,
                )
            ),
            Expanded(
              flex: 3,
              child: Image.network(
                figure.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
    ),
    );
  }
}
