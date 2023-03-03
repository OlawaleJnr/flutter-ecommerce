// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product.dart';

class FirestoreService {
  final String uid; 

  FirestoreService({required this.uid}); 
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    await firestore.collection('products').add(product.toMap())
    .then((result) => {
      print(result)
    })
    .catchError((onError) => {
      print('An error occurred while processing this request')
    });
  }
}