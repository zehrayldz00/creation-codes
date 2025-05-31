import 'package:creationcodes/presentation/widgets/model_viewer_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/services/firebase_storage_service.dart';

class ModelPage extends StatelessWidget {
  final String modelPath;

  const ModelPage({super.key, required this.modelPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Model Görüntüleme"),),
      body: FutureBuilder<String> (
        future: FirebaseStorageService.getModelDownloadUrl(modelPath),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ModelViewerWidget(modelPath: snapshot.data!);
          } else if(snapshot.hasError){
            return Center(child: Text("Hata: ${snapshot.error}"),);
          }
          return const Center(child: CircularProgressIndicator(),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _refreshModel(context),
        child: Icon(Icons.refresh),
      ),
    );
  }
  void _refreshModel (BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Model Yükleniyor.."))
    );
  }
}

