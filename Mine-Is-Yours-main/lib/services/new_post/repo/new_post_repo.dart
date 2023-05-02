import 'package:mus_app/network/firebase_database.dart';

abstract class NewPostRepo {
  static Future<void> addNewPost({required String id,required Map<String,dynamic> data})async{
    await FireStoreHelper.instance.addDocument(document: Document(id: id, collection: "Posts",data: data));
  }
}