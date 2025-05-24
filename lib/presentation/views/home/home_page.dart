import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:creationcodes/core/constants/app_paddings.dart';
import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:creationcodes/presentation/viewmodels/category_viewmodel.dart';
import 'package:creationcodes/presentation/views/category_detail/category_detail_page.dart';
import 'package:creationcodes/presentation/widgets/language_select_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../widgets/category_card_widget.dart';

/*
  TR:
  Categorilerin gösterildiği ve tıklanabilir olduğu sayfa.
  Dil seçimi imkanı olduğu için ve seçime göre yenileneceği için stateful.
  EN:
  The page that include clickable categories. The page is stateful
  because of including language selection.
 */
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CategoryViewModel viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = Provider.of<CategoryViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convince Me', style: AppTextStyles.header),
        backgroundColor: AppColors.background,
        actions: [LanguageSelectButton()],
      ),
      backgroundColor: AppColors.background,
      body: Consumer<CategoryViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.error != null) {
            return Center(child: Text('Hata: ${viewModel.error}'));
          }

          return GridView.builder(
            padding: AppPaddings.all,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 3 / 4,
            ),
            itemCount: vm.categories.length,
            itemBuilder: (context, index) {
              final category = vm.categories[index];
              return CategoryCard(
                category: category.toModel(),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => CategoryDetailPage(modelIDs: category.modelID),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
