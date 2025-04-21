import 'package:creationcodes/domain/repositories/figure_repository.dart';

import '../entities/figure.dart';

class GetFiguresByIdsUseCase{
  final FigureRepository repository;

  GetFiguresByIdsUseCase(this.repository);

  Future<List<Figure>> call(List<String> ids) async{
    return await repository.getFiguresByIds(ids);
  }
}