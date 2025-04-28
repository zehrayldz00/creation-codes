import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creationcodes/core/services/language_service.dart';
import 'package:creationcodes/data/repositories/category_repository_impl.dart';
import 'package:creationcodes/data/repositories/figure_repository_impl.dart';
import 'package:creationcodes/presentation/viewmodels/category_viewmodel.dart';
import 'package:creationcodes/presentation/viewmodels/figure_viewmodel.dart';
import 'package:creationcodes/presentation/views/home/home_page.dart';
import 'package:creationcodes/presentation/views/language_selection/language_selection_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/datasources/category_remote_datasource.dart';
import 'data/datasources/figure_remote_datasource.dart';
import 'domain/usecases/get_categories_usecases.dart';
import 'domain/usecases/get_figures_byids_usecases.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final languageService = await LanguageService.getInstance();
  bool isLanguageSelected = languageService.isLanguageSelected();

  runApp(MyApp(isLanguageSelected : isLanguageSelected));
}

class MyApp extends StatelessWidget {
  final bool isLanguageSelected;

  const MyApp({super.key, required this.isLanguageSelected});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final viewModel = CategoryViewModel(
              getCategoriesUseCase: GetCategoriesUseCase(
                CategoryRepositoryImpl(
                  remoteDataSource: CategoryRemoteDataSourceImpl(
                    firestore: FirebaseFirestore.instance,
                  ),
                ),
              ),
            );
            viewModel.fetchCategories();
            return viewModel;
          },
        ),
        ChangeNotifierProvider(
            create: (_) {
              final viewModel = FigureViewModel(
                  getFiguresByIdsUseCase: GetFiguresByIdsUseCase(
                      FigureRepositoryImpl(
                          remoteDataSource: FigureRemoteDataSourceImpl(
                            firestore: FirebaseFirestore.instance,
                          )
                      )
                  )
              );
              //viewModel.getFiguresByIdsUseCase();
              return viewModel;
            }
        ),
      ],
      child: MaterialApp(
        title: 'CreationCodes',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: isLanguageSelected ? HomePage() : LanguageSelectionPage(),
      ),
    );
  }
}
