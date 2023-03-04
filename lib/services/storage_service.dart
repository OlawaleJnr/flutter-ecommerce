import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

/// This service will be responsible for uploading files to our cloud storage and retrieving their downloadable URL which we will use to display the image from the server.
class StorageService {
  /// A property that is being passed in from the constructor.
  final String uid; 

  /// A constructor that is taking in a uid.
  StorageService({required this.uid});

  /// Creating a new instance of the FirebaseStorage class.
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> uploadFile(String filePath) async {
    try {
      final dateTime = DateTime.now().toIso8601String();
      final ref = storage.ref("$uid/$dateTime");
      final uploadTask = await ref.putFile(File(filePath));
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      // ignore: avoid_print
      print('An error occured while processing this request'); 
    }
    return "";
  }
}