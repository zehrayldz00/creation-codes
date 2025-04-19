import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creationcodes/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.title,
    required super.imageUrl,
    required super.modelID,
  });

  factory CategoryModel.fromFirestore(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;

    return CategoryModel(
        title: Map<String, String>.from(data['title'] ?? {}),
        imageUrl: data['imageUrl'] ?? '',
        modelID: List<String>.from(data['modelID'] ?? []),
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'title' : title,
      'imageUrl' : imageUrl,
      'modelID' : modelID
    };
  }

}
