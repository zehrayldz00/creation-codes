import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creationcodes/data/models/figure_model.dart';

abstract class FigureRemoteDataSource {
  Future<List<FigureModel>> getFiguresByIds(List<String> ids);
}

class FigureRemoteDataSourceImpl implements FigureRemoteDataSource {
  final FirebaseFirestore firestore;
  final String languageCode;

  FigureRemoteDataSourceImpl({
    required this.firestore,
    required this.languageCode,
  });

  @override
  Future<List<FigureModel>> getFiguresByIds(List<String> ids) async {
    try {
      if (ids.isEmpty) return [];

      final snapshot =
          await FirebaseFirestore.instance
              .collection('models')
              .where(FieldPath.documentId, whereIn: ids)
              .get();

      return snapshot.docs.map((doc) => FigureModel.fromFirestore(doc)).toList();
    }
    catch(e){
      throw Exception('Figürleri çekemedik: $e');
    }
  }
}
