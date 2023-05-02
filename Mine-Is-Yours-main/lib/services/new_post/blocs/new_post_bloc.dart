import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mus_app/core/app_core.dart';
import 'package:mus_app/core/app_notification.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/network/firebase_database.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/blocs/home_bloc.dart';
import 'package:mus_app/services/home/models/post_model.dart';
import 'package:mus_app/services/new_post/blocs/custom_model_sheet.dart';
import 'package:mus_app/services/new_post/repo/new_post_repo.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/app_event.dart';
import '../../../core/app_state.dart';

class NewPostBloc extends Bloc<AppEvent, AppState> {
  static NewPostBloc get instance => BlocProvider.of(RouterGenerator.navigatorState.currentContext!);

  NewPostBloc() : super(Start());

  final bookName = BehaviorSubject<String?>();
  final bookCategory = BehaviorSubject<CustomModelSheet?>();
  final author = BehaviorSubject<String?>();
  final pageNumber = BehaviorSubject<String?>();
  final language = BehaviorSubject<CustomModelSheet?>();
  final bookstate = BehaviorSubject<CustomModelSheet?>();
  final bookDescribtion = BehaviorSubject<String?>();
  final bookPoints = BehaviorSubject<String?>();

  Function(String?) get updateBookName => bookName.sink.add;
  Function(CustomModelSheet?) get updateBookCategory => bookCategory.sink.add;
  Function(String?) get updateAuthor => author.sink.add;
  Function(String?) get updatePageNumber => pageNumber.sink.add;
  Function(CustomModelSheet?) get updateLanguage => language.sink.add;
  Function(CustomModelSheet?) get updateBookState => bookstate.sink.add;
  Function(String?) get updateBookDescribtion => bookDescribtion.sink.add;
  Function(String?) get updateBookPoints => bookPoints.sink.add;

  Stream<String?> get bookNameStream => bookName.stream.asBroadcastStream();
  Stream<CustomModelSheet?> get bookCategoryStream => bookCategory.stream.asBroadcastStream();
  Stream<String?> get authorStream => author.stream.asBroadcastStream();
  Stream<String?> get pageNumberStream => pageNumber.stream.asBroadcastStream();
  Stream<CustomModelSheet?> get languageStream => language.stream.asBroadcastStream();
  Stream<CustomModelSheet?> get bookStateStream => bookstate.stream.asBroadcastStream();
  Stream<String?> get bookDescribtionStream => bookDescribtion.stream.asBroadcastStream();
  Stream<String?> get bookPointsStream => bookPoints.stream.asBroadcastStream();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield Loading();
    try {
      if (event is Add) {
        Map<String,dynamic> data = {
          "book": {
            "title": bookName.valueOrNull,
            "image_url": "https://i1.wp.com/egmooreauthor.com/wp-content/uploads/2021/01/MOON_Daughter_Cover_7.jpg?resize=768%2C1186&ssl=1",
            "id": "bo000${HomeBloc.instance.data.length+1}",
            "describtion": bookDescribtion.valueOrNull,
            "lang": language.valueOrNull!.value,
            "state": bookstate.valueOrNull!.value,
            "rate": 0.0,
            "pages": int.parse(pageNumber.valueOrNull!),
            "points":int.parse(bookPoints.valueOrNull??"0"),
            "owner": {
              "name": author.valueOrNull,
              "image": "https://pngimg.com/uploads/businessman/businessman_PNG6582.png",
              "id": "pe000${HomeBloc.instance.data.length+1}",
            }
          },
          "created_date": Timestamp.fromDate(DateTime.now()),
          "state": false,
        };
        print(data);
      await NewPostRepo.addNewPost(id: "po000${HomeBloc.instance.data.length+1}", data: data);
        HomeBloc.instance.add(GetData());
        RouterGenerator.pop();
        // AppCore.showSnackBar(notification: AppNotification(message: "New Post have been added",backgroundColor: AppColor.APPROVED_COLOR));
        yield Done();
        
      }
    } catch (e) {
      print(e);
        // AppCore.showSnackBar(notification: AppNotification(message: "New Post have been added",backgroundColor: AppColor.APPROVED_COLOR));
      yield Error();
    }
  }
}
