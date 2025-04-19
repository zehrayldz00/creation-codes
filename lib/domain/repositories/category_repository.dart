import 'package:creationcodes/domain/entities/category.dart';

abstract class CategoryRepository{
  Future<List<Category>> getCategories();
}