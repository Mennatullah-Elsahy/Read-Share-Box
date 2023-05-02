import 'package:mus_app/network/firebase_database.dart';

abstract class Mapper{}

abstract class SingleMapper implements Mapper{
  fromDocument({required Document document});
  toDocument();
  fromMap({required Map<String,dynamic> data});
  toMap();
}