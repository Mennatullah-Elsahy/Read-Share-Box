import 'package:mus_app/network/firebase_database.dart';
import 'package:mus_app/services/home/models/category.dart';

import '../models/post_model.dart';

abstract class HomeRepo {
  static Future<List<PostModel>> getPosts() async {
    return (await FireStoreHelper.instance
            .getDocumentsList(collection: "Posts"))
        .map((document) => PostModel(document: document))
        .toList();
  }

  static Future<List<Category>> getCategories() async {
    return (await FireStoreHelper.instance
            .getDocumentsList(collection: "Categories"))
        .map((document) {
      Category category = Category();
      category.fromDocument(document: document);
      return category;
    }).toList();
  }
}
