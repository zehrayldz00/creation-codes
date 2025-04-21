import 'package:creationcodes/data/models/figure_model.dart';

class Figure {
  final Map<String, String> title;
  final Map<String, String> description;
  final String imageUrl;
  final String modelUrl;

  const Figure({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.modelUrl,
  });

  FigureModel toModel() {
    return FigureModel(
      title: title,
      description: description,
      imageUrl: imageUrl,
      modelUrl: modelUrl,
    );
  }
}
