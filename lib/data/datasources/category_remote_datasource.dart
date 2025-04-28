
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creationcodes/data/models/category_model.dart';

import '../../core/services/language_service.dart';

// Abstract interface – sadece 'ne yapılacak' tanımlanır
abstract class CategoryRemoteDataSource{
  Future<List<CategoryModel>> getCategories();
}

// Gerçek uygulama – Firestore'dan veri alır ve işler
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource{
  final FirebaseFirestore firestore;

// Constructor – dışarıdan bir Firestore örneği alır
  CategoryRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<CategoryModel>> getCategories() async {
    try{
      final languageService = await LanguageService.getInstance();
      final selectedLanguageCode = languageService.selectedLanguageCode ?? 'tr';

      // "categories" koleksiyonundaki tüm dökümanları al
      final snapshot = await firestore.collection('categories').get();

      // Her dökümanı CategoryModele çevir ve liste olarak döndür
      return snapshot.docs.map((doc) {
        final model = CategoryModel.fromFirestore(doc);
        return CategoryModel(
            title: {selectedLanguageCode : model.title[selectedLanguageCode] ?? model.title.values.first,},
            imageUrl: model.imageUrl,
            modelID: model.modelID
        );
      }).toList();
    }
    catch(e){
      // Hata olursa ileriye dönük özel exception sınıfları tanımlanabilir
      throw Exception('Kategori verileri alınamadı.: $e');
    }
  }
}