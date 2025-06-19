import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:creationcodes/presentation/viewmodels/figure_viewmodel.dart';
import 'package:creationcodes/presentation/widgets/figure_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_paddings.dart';

class CategoryDetailPage extends StatefulWidget {
  final List<String> modelIDs;

  const CategoryDetailPage({super.key, required this.modelIDs});

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  late FigureViewModel viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    viewModel = Provider.of<FigureViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchFiguresByCategory(widget.modelIDs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Miracles'), backgroundColor: AppColors.background,),
      backgroundColor: AppColors.background,
      body: Consumer<FigureViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) return Center(child: CircularProgressIndicator());
          if (vm.error != null) return Text("Hata var hata: ${vm.error}");

          return GridView.builder(
            padding: AppPaddings.figureCardAll,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 30,
              childAspectRatio: 1,
            ),
            itemCount: vm.figures.length,
            itemBuilder: (context, index) {
              final figure = vm.figures[index];
              return FigureCardWidget(figure: figure.toModel(), onTap: (){});
            },
          );
        },
      ),
    );
  }
}
