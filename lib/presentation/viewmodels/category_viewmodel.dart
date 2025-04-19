

import 'package:creationcodes/domain/usecases/get_categories_usecases.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';

class CategoryViewModel extends ChangeNotifier {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryViewModel({required this.getCategoriesUseCase});

  List<Category> _categories = [];
  List<Category> get categories => _categories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchCategories() async{
    _isLoading = true;
    notifyListeners();


    try {
      _categories = await getCategoriesUseCase.call();
      _error = null;
    }
    catch(e){
      _error = e.toString();
    }

    finally {
      _isLoading = false;
      notifyListeners();
    }
  }


}