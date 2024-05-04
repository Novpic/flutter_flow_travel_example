import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseRepository {
  Stream<List<Map<String, dynamic>>> readAllCollection(String collectionName) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data()..['id'] = doc.id;
      }).toList();
    });
  }

  Stream<List<Map<String, dynamic>>> readAllCollectionWhere(
      String collectionName, String field, dynamic value) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .where(field, isEqualTo: value)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => doc.data()..['id'] = doc.id).toList());
  }

  Future<void> updateCollection(
      String collectionName, String docId, Map<String, dynamic> data) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docId)
        .update(data);
  }
}

final fireStoreRepositoryProvider =
    Provider<FirebaseRepository>((ref) => FirebaseRepository());
