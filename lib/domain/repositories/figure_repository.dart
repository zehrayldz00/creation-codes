import '../entities/figure.dart';

abstract class FigureRepository{
  Future<List<Figure>> getFiguresByIds(List<String> ids);
}