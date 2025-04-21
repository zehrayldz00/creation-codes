import 'package:creationcodes/data/models/category_model.dart';

class Category {
  final Map<String, String> title;
  final String imageUrl;
  final List<String> modelID;

  const Category({
    required this.title,
    required this.imageUrl,
    required this.modelID,
  });

  CategoryModel toModel() {
    return CategoryModel(title: title, imageUrl: imageUrl, modelID: modelID);
  }
}
