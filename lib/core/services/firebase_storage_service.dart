import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService{

  static final Map<String,String> _cache = {};

  static Future<String> getModelDownloadUrl(String modelPath) async {
    if(_cache.containsKey(modelPath)){
      return _cache[modelPath]!;
    }
      final ref = FirebaseStorage.instance.ref().child(modelPath);
      final url = await ref.getDownloadURL();
      _cache [modelPath] = url;
      return url;

  }
}