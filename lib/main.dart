import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creationcodes/core/utils/shared_preferences_manager.dart';
import 'package:creationcodes/data/repositories/category_repository_impl.dart';
import 'package:creationcodes/data/repositories/figure_repository_impl.dart';
import 'package:creationcodes/domain/usecases/set_onboarding_seen_usecases.dart';
import 'package:creationcodes/presentation/viewmodels/category_viewmodel.dart';
import 'package:creationcodes/presentation/viewmodels/figure_viewmodel.dart';
import 'package:creationcodes/presentation/viewmodels/language_viewmodel.dart';
import 'package:creationcodes/presentation/viewmodels/onboarding_viewmodel.dart';
import 'package:creationcodes/presentation/views/language_selection/language_selection_page.dart';
import 'package:creationcodes/presentation/views/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/datasources/category_remote_datasource.dart';
import 'data/datasources/figure_remote_datasource.dart';
import 'domain/usecases/get_categories_usecases.dart';
import 'domain/usecases/get_figures_byids_usecases.dart';
import 'domain/usecases/is_onboarding_seen_usecases.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final languageViewModel = LanguageViewModel();

  final helper = SharedPreferencesManager();
  final isSeenUseCase = IsOnboardingSeenUseCase(helper);
  final isSeen = await isSeenUseCase();

  runApp(
    ChangeNotifierProvider(
      create: (_) => languageViewModel,
      child: MyApp(isOnboardingSeen : isSeen),
    )
  );
}

class MyApp extends StatefulWidget {
  final bool isOnboardingSeen;

  const MyApp({super.key, required this.isOnboardingSeen});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final languageCode = context.read<LanguageViewModel>().selectedLanguageCode ?? 'en';
            final viewModel = CategoryViewModel(
              getCategoriesUseCase: GetCategoriesUseCase(
                CategoryRepositoryImpl(
                  remoteDataSource: CategoryRemoteDataSourceImpl(
                    firestore: FirebaseFirestore.instance,
                    languageCode: languageCode
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
              final languageCode = context.read<LanguageViewModel>().selectedLanguageCode ?? 'en';
              final viewModel = FigureViewModel(
                  getFiguresByIdsUseCase: GetFiguresByIdsUseCase(
                      FigureRepositoryImpl(
                          remoteDataSource: FigureRemoteDataSourceImpl(
                            firestore: FirebaseFirestore.instance,
                            languageCode: languageCode,
                          )
                      )
                  )
              );
              //viewModel.getFiguresByIdsUseCase();
              return viewModel;
            }
        ),
        ChangeNotifierProvider(
            create: (_) => OnboardingViewModel(
                isSeenUseCase: IsOnboardingSeenUseCase(SharedPreferencesManager()),
                setSeenUseCase: SetOnboardingSeenUseCase(SharedPreferencesManager())
            )
        ),

      ],
      child: MaterialApp(
        title: 'CreationCodes',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: widget.isOnboardingSeen ? SplashPage() : LanguageSelectionPage(),
      ),
    );
  }
}
