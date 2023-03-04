// These providers will be our top-level providers for the entire app that will serve some of the key firebase states that we will need.
import 'package:ecommerce/services/firestore_service.dart';
import 'package:ecommerce/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Creating a provider that will return a FirebaseAuth instance.
final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

/// Creating a provider that will return a stream of the current user.
final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

/// This is a provider that will return a FirestoreService instance.
final databaseProvider = Provider<FirestoreService?>((ref) {
  /// Watching the authStateChangesProvider and assigning it to the auth variable.
  final auth = ref.watch(authStateChangesProvider);
  /// Checking if the auth is not null and if the value is not null and if the uid is not null.
  String? uid = auth.asData?.value?.uid;
  /// This is checking if the uid is not null and if it is not null, it will return a FirestoreService instance.
  if (uid != null) {
    return FirestoreService(uid: uid);
  }
  return null;
});

/// This is a provider that will return a StorageService instance.
final storageProvider = Provider<StorageService?>((ref) {
  /// Watching the authStateChangesProvider and assigning it to the auth variable.
  final auth = ref.watch(authStateChangesProvider);
  /// Checking if the auth is not null and if the value is not null and if the uid is not null.
  String? uid = auth.asData?.value?.uid;
  /// This is checking if the uid is not null and if it is not null, it will return a StorageService instance.
  if (uid != null) {
    return StorageService(uid: uid);
  }
  return null;
});