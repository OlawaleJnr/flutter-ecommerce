import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product.dart';

class FirestoreService {
  /// A property that is being passed in from the constructor.
  final String uid; 

  /// A constructor that is taking in a uid.
  FirestoreService({required this.uid}); 

  /// Creating a new instance of the FirebaseFirestore class.
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// We create a new document in the products collection, and then we set the data of that document to the product's map
  /// 
  /// Args: product (Product): The product object that we want to add to the database.
  Future<void> addProduct(Product product) async {
    final documentId = firestore.collection('products').doc().id;
    await firestore.collection('products').doc(documentId).set(product.toMap(documentId));
  }

  /// Get the products collection from firestore, get the snapshots, loop through the docs, get the data, convert into a map, and build a list out of the products mapping
  /// 
  /// Returns: A stream of a list of products
  Stream<List<Product>> getProducts() {
    return firestore.collection('products') // gets collection
    .snapshots() // gets snapshots, then loop through
    .map((snapshot) => snapshot.docs.map((doc) { // loop through docs
      final d = doc.data(); // for each doc get the data
      return Product.fromMap(d); // convert into a map
    }).toList()); // build a list out of the products mapping
  }

  /// It deletes a product from the database.
  /// 
  /// Args: id (String): The id of the product to be deleted.
  /// 
  /// Returns: A Future<void>
  Future<void> deleteProduct(String id) async {
    return await firestore.collection('products').doc(id).delete();
  }
}