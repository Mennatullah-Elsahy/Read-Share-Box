import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mus_app/core/app_core.dart';
import 'package:mus_app/core/app_notification.dart';

class FireStoreHelper {
  static FireStoreHelper instance = FireStoreHelper._internal();
  FireStoreHelper._internal();
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Document _convertToDocument(DocumentSnapshot snapshot,String collection)=>Document(id: snapshot.id, collection: collection,data: snapshot.data() as Map<String,dynamic>);
  DocumentReference _catchDocument(Document document) => _db.collection(document.collection).doc(document.id);
  Future<void> addDocument({required Document document})async => await _catchDocument(document).set(document.data);
  Future<void> removeDocument({required Document document}) async => await _catchDocument(document).delete();
  Future<Document> getDocument({required Document document}) async => _convertToDocument((await _catchDocument(document).get()), document.collection);
  Future<void> updateDocument({required Document document}) async => await _catchDocument(document).update(document.data!);
  Future<List<Document>> getDocumentsList({required String collection}) async => (await _db.collection(collection).get()).docs.map((doc) => _convertToDocument(doc, collection)).toList();
}

class Document{
  String id,collection;
  Map<String,dynamic>? data;

  Document({required this.id,this.data,required this.collection});
}