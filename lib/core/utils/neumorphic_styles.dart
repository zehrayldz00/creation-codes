import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import '../constants/app_colors.dart';

class NeumorphicStyles{
  static final defaultCard = NeumorphicStyle(
    shape:NeumorphicShape.concave,
    depth: 3,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
    color: AppColors.background,
    lightSource: LightSource.topLeft
  );
}