import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerWidget extends StatefulWidget {
  final String modelPath;
  const ModelViewerWidget({super.key, required this.modelPath});

  @override
  State<ModelViewerWidget> createState() => _ModelViewerWidgetState();
}

class _ModelViewerWidgetState extends State<ModelViewerWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ModelViewer(
            backgroundColor: Colors.transparent,
            src: widget.modelPath,
            autoRotate: false,
            cameraControls: true,
            disableZoom: false,
            loading: Loading.eager,
          ),
        ],
      ),
    );
  }
}
