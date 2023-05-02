import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mus_app/core/app_core.dart';
import 'package:mus_app/core/app_event.dart';
import 'package:mus_app/core/app_notification.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/models/category.dart';
import 'package:mus_app/services/home/models/post_model.dart';
import 'package:mus_app/services/home/pages/home_page.dart';
import 'package:mus_app/services/home/repo/posts_repo.dart';
import 'package:mus_app/services/home/widgets/book_home_widget.dart';

import '../../../core/app_state.dart';

class CategoryBlock extends Bloc<AppEvent, AppState> {
  static CategoryBlock get instance =>
      BlocProvider.of(RouterGenerator.navigatorState.currentContext!);

  CategoryBlock() : super(Start());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield Loading();
    try {
      if (event is GetData) {
        List<Category> data = await HomeRepo.getCategories();
        if (data.isNotEmpty) {
          yield Done(
              data: data,
              cards: List.generate(
                  data.length, (index) => CategoryCard(value: data[index].name!)));
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
