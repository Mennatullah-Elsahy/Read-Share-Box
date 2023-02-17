import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mus_app/network/firebase_database.dart';
import 'package:mus_app/network/mapper.dart';

class PostModel extends SingleMapper{
  Timestamp? createdDate;
  bool? state;
  Book? book;
  late Document meta;
  PostModel({required Document document}){fromDocument(document: document);}
  @override
  fromDocument({required Document document}) {
    fromMap(data: document.data??{});
    meta = document;
  }

  @override
  fromMap({required Map<String, dynamic> data}) {
    createdDate = data["created_date"];
    state = data["state"];
    book = Book.fromMap(data['book']);
  }

  @override
  toDocument() => Document(id: meta.id, collection: meta.collection,data: toMap());

  @override
  toMap() => {"created_date":createdDate,"state":state,"book":book!.toMap()};
  
}

class Book {
  String? title,describtion,image,id,lang,state;
  double? rate;
  int? pages,points;
  Owner? owner;

  Book.fromMap(Map<String,dynamic> data){
    title = data["title"];
    describtion = data["describtion"];
    image = data['image_url'];
    id = data['id'];
    lang = data["lang"];
    state = data['state'];
    pages = data["pages"];
    rate = data['rate'].toDouble();
    points = data["points"];
    owner = Owner.fromMap(data['owner']);
  }
  
  toMap()=>{"points":points,"title":title,"image":image,"id":id,"describtion":describtion,"lang":lang,"state":state,"rate":rate,"pages":pages,"owner":owner!.toMap()};
}

class Owner{
  String? name,image,id;
  Owner.fromMap(Map<String,dynamic> data){
    name = data["name"];
    image = data["image"];
    id = data["id"];
  }
  toMap()=>{"name":name,"image":image,"id":id};
}