import 'package:creationcodes/presentation/viewmodels/language_viewmodel.dart';
import 'package:creationcodes/presentation/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageViewModel = context.read<LanguageViewModel>();

    return FutureBuilder(
        future: languageViewModel.loadLanguage(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if(snapshot.hasError){
            return const Scaffold(
              body: Center(child: Text("Bir hata oluştu."),),
            );
          } else{
            return HomePage();
          }
        }
    );
  }
}
