import 'package:creationcodes/core/constants/app_text_styles.dart';
import 'package:creationcodes/presentation/widgets/model_viewer_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_paddings.dart';
import '../../../core/services/firebase_storage_service.dart';

class ModelPage extends StatefulWidget {
  final String modelPath;
  final String title;
  final String ayet;
  final String description;

  const ModelPage({
    super.key,
    required this.modelPath,
    required this.title,
    required this.ayet,
    required this.description,
  });

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollProgress = 0.0;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      print('maxScroll: $maxScroll, currentScroll: $currentScroll');
      setState(() {
        _scrollProgress =
            (maxScroll == 0) ? 0 : (currentScroll / maxScroll).clamp(0.0, 1.0);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: FutureBuilder<String>(
        future: FirebaseStorageService.getModelDownloadUrl(widget.modelPath),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                LinearProgressIndicator(
                  value: _scrollProgress,
                  minHeight: 4,
                  color: Colors.blue,
                  backgroundColor: Colors.grey.shade300,
                ),
                Expanded(
                  child: Scrollbar(
                    thickness: 8,
                    controller: _scrollController,
                    trackVisibility: true,
                    child: ListView(
                      controller: _scrollController,
                      children: [
                        ModelViewerWidget(modelPath: snapshot.data!),
                        Padding(
                          padding: AppPaddings.ayetPadding,
                          child: Text(
                            widget.ayet,
                            style: AppTextStyles.ayetStyle,
                          ),
                        ),
                        Padding(
                          padding: AppPaddings.figureCardAll,
                          child: Text(
                            widget.description,
                            style: AppTextStyles.subtitle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
            //
          } else if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
