import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService{
  static Future<String> getModelDownloadUrl(String modelPath) async {
      final ref = FirebaseStorage.instance.ref().child(modelPath);
      final url = await ref.getDownloadURL();
      return url;

  }
}