import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

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
    return InkWell(
      onTap: (){},
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
            SizedBox(height: 8,),
            Expanded(
              flex: 1,
                child: Text(
                  figure.title['en'] ?? "",
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
            const SizedBox(height: 5),
          ],
        ),
    ),
    );
  }
}
