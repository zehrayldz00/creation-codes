import 'package:creationcodes/core/constants/app_colors.dart';
import 'package:creationcodes/presentation/viewmodels/figure_viewmodel.dart';
import 'package:creationcodes/presentation/widgets/figure_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_paddings.dart';

class CategoryDetailPage extends StatelessWidget {
  final List<String> modelIDs;

  const CategoryDetailPage({super.key, required this.modelIDs});

  @override
  Widget build(BuildContext context) {

    final viewModel = Provider.of<FigureViewModel>(context, listen:false);

    WidgetsBinding.instance.addPostFrameCallback((_){
      viewModel.fetchFiguresByCategory(modelIDs);
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Consumer<FigureViewModel>(
        builder: (context, vm, _){
      if(vm.isLoading) return Center(child: CircularProgressIndicator());
      if(vm.error != null) return Text("Hata var hata: ${vm.error}");

      return GridView.builder(
        padding: AppPaddings.all,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //ikişerli
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemCount: vm.figures.length,
        itemBuilder: (context, index) {
          final figure = vm.figures[index];
          return FigureCardWidget(
            figure: figure.toModel(),
            onTap: () {},
          );
        },
      );})




      /*Consumer<FigureViewModel>(
          builder: (context, vm, _){
            if(vm.isLoading) return Center(child: CircularProgressIndicator());
            if(vm.error != null) return Text("Hata var hata: ${vm.error}");

            return ListView.builder(
              itemCount: vm.figures.length,
              itemBuilder: (_, index){
                final figure = vm.figures[index];
                return FigureCardWidget(
                    figure: figure.toModel(),
                    onTap: (){}
                );
              },
            );
          }
      ),*/
    );
  }
}
