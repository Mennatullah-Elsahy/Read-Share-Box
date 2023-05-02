import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/app_states.dart';

class SearchCubit extends Cubit<AppStates> {
  SearchCubit() : super(Empty());

  bool showAsGrid = false;
  String searchKeyWork = "";
  void changeView() {
    showAsGrid = !showAsGrid;
    emit(Empty());
  }

  void search(String keyWord) {
    emit(Loading());
    searchKeyWork = keyWord;
    // TODO: search function
    emit(Empty());
  }
}
