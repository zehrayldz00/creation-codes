import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:creationcodes/core/constants/app_paddings.dart';
import 'package:creationcodes/presentation/viewmodels/category_viewmodel.dart';
import 'package:creationcodes/presentation/views/category_detail/category_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/category_card_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategoryViewModel>(context);
    final categories = viewModel.categories;

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (viewModel.error != null) {
      return Center(child: Text('Hata: ${viewModel.error}'));
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: GridView.builder(
        padding: AppPaddings.all,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //ikişerli
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryCard(
            category: category,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CategoryDetailPage()),
              );
            },
          );
        },
      ),
    );
  }
}
