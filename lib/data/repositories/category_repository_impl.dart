import 'package:creationcodes/data/datasources/category_remote_datasource.dart';
import 'package:creationcodes/domain/repositories/category_repository.dart';

import '../../domain/entities/category.dart';

class CategoryRepositoryImpl implements CategoryRepository{
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({ required this.remoteDataSource});

  @override
  Future<List<Category>> getCategories() async{
      final categoryModels = await remoteDataSource.getCategories();

      return categoryModels.map((model) => Category(
          title: model.title,
          imageUrl: model.imageUrl,
          modelID: model.modelID
      )).toList();


  }
}