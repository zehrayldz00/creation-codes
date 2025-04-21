import 'package:flutter/cupertino.dart';

import '../../domain/entities/figure.dart';
import '../../domain/usecases/get_figures_byids_usecases.dart';

class FigureViewModel extends ChangeNotifier{
  final GetFiguresByIdsUseCase getFiguresByIdsUseCase;

  FigureViewModel({required this.getFiguresByIdsUseCase});

  List<Figure> _figures = [];
  List<Figure> get figures => _figures;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchFiguresByCategory (List<String> ids) async{
    _isLoading = true;
    notifyListeners();

    try{
      _figures = await getFiguresByIdsUseCase.call(ids);
      _error = null;

    }
    catch(e){
      _error = e.toString();
    }

    finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}