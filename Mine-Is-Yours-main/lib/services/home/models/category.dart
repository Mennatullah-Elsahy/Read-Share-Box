import 'package:mus_app/network/firebase_database.dart';
import 'package:mus_app/network/mapper.dart';

class Category extends SingleMapper {
 late String id;
  String? name;

  @override
  fromDocument({required Document document}) {
    id = document.id;
    fromMap(data: document.data!);
  }

  @override
  fromMap({required Map<String, dynamic> data}) {
    name = data['name'];
  }

  @override
  toDocument() {
    // TODO: implement toDocument
    throw UnimplementedError();
  }

  @override
  toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
