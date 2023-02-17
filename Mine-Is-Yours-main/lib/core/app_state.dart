
import 'package:flutter/material.dart';

import '../network/mapper.dart';

abstract class AppState {}

class Done extends AppState{
  List? data;
  List<Widget>? cards;
  dynamic model;
  Done({this.data,this.cards,this.model});
}

class Start extends AppState {}

// class Done extends AppState {
//   Mapper? model;
//   List<Widget>? cards;
//   List<CustomModelSheet>? list;
//   bool? reload;
//   bool? loading;

//   Done({this.model, this.cards, this.list, this.reload = true , this.loading = false});
// }


class Error extends AppState {}

class Loading extends AppState {}
class UnVisiable extends AppState{}

class Empty extends AppState {
  final bool? initial;

  Empty({this.initial});
}
