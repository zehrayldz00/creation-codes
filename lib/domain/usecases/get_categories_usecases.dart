
import 'package:creationcodes/domain/repositories/category_repository.dart';

import '../entities/category.dart';

class GetCategoriesUseCase{
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<Category>> call() async{
    return await repository.getCategories();
  }
}