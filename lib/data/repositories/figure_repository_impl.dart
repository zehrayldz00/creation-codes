import 'package:creationcodes/domain/entities/figure.dart';
import 'package:creationcodes/domain/repositories/figure_repository.dart';

import '../datasources/figure_remote_datasource.dart';

class FigureRepositoryImpl implements FigureRepository {
  final FigureRemoteDataSource remoteDataSource;

  FigureRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Figure>> getFiguresByIds(List<String> ids) async {
    final figureModels = await remoteDataSource.getFiguresByIds(ids);

    return figureModels
        .map(
          (model) => Figure(
            title: model.title,
            description: model.description,
            ayet: model.ayet,
            id: model.id,
            imageUrl: model.imageUrl,
            modelUrl: model.modelUrl,
          ),
        )
        .toList();
  }

}
