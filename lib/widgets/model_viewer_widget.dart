import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerWidget extends StatelessWidget {
  final String modelPath;

  const ModelViewerWidget({super.key, required this.modelPath});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        child: ModelViewer(
          src: modelPath,
          alt: "3D Model",
          ar: true,
          autoRotate: false,
          cameraControls: true,
        ),
      );

  }
}
