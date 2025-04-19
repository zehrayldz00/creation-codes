import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creationcodes/data/repositories/category_repository_impl.dart';
import 'package:creationcodes/presentation/viewmodels/category_viewmodel.dart';
import 'package:creationcodes/presentation/views/home/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/datasources/category_remote_datasource.dart';
import 'domain/usecases/get_categories_usecases.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(_) => CategoryViewModel(
            getCategoriesUseCase: GetCategoriesUseCase(
                CategoryRepositoryImpl(
                  remoteDataSource: CategoryRemoteDataSourceImpl(
                      firestore: FirebaseFirestore.instance
                    ),
                )
              ),
          ),
        )
      ],
      child: MaterialApp(
        title: 'CreationCodes',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurple,
        ),
        home: const HomePage(),
      ),
    );
  }
}
