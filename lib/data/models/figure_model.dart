import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/figure.dart';

class FigureModel extends Figure {
  const FigureModel({
    required super.title,
    required super.description,
    required super.ayet,
    required super.id,
    required super.imageUrl,
    required super.modelUrl,
  });

  factory FigureModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return FigureModel(
      title: Map<String, String>.from(data['title'] ?? {}),
      description: Map<String, String>.from(data['description'] ?? {}),
      ayet: Map<String,String>.from(data['ayet'] ?? {}),
      id: doc.id,
      imageUrl: data['imageUrl'] ?? {},
      modelUrl: data['modelUrl'] ?? {},
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'ayet' : ayet,
      'imageUrl': imageUrl,
      'modelUrl': modelUrl,
    };
  }
}
