import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mus_app/core/app_core.dart';
import 'package:mus_app/core/app_event.dart';
import 'package:mus_app/core/app_notification.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/models/post_model.dart';
import 'package:mus_app/services/home/repo/posts_repo.dart';
import 'package:mus_app/services/home/widgets/book_home_widget.dart';

import '../../../core/app_state.dart';

class HomeBloc extends Bloc<AppEvent, AppState> {
  static HomeBloc get instance =>
      BlocProvider.of(RouterGenerator.navigatorState.currentContext!);

  HomeBloc() : super(Start());
  List<PostModel> data = [];
  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield Loading();
    try {
      if (event is GetData) {
        data = await HomeRepo.getPosts();
        if (data.isNotEmpty) {
          yield Done(
            cards: List.generate(
              data.length,
              (index) => BookHomeWidget(
                model: data[index],
              ),
            ),
            data: data
          );
        } else {
          yield Empty();
        }
      }
    } on FirebaseException catch (e) {
      AppCore.showSnackBar(
          notification: AppNotification(
              message: e.message!, backgroundColor: AppColor.REJECTED));
    }
  }
}
