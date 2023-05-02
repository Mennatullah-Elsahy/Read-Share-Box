import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/models/select_option.dart';
import '../../../base/widgets/fields/location_input_field.dart';
import '../../../config/app_events.dart';
import '../../../config/app_states.dart';

class AddPostBloc extends Bloc<AppEvents, AppStates> {
  AddPostBloc() : super(Start()) {
    on<Next>(_goToNextPage);
    on<Previous>(_goToPreviousPage);
    on<Update>(_update);
  }
  //===========================
  //=========================== Page setup
  int pageIndex = 0;
  _goToPreviousPage(AppEvents event, Emitter emit) {
    if (pageIndex > 0) pageIndex--;
    emit(Start());
  }

  _goToNextPage(AppEvents event, Emitter emit) {
    emit(Loading());
    switch (pageIndex) {
      case 0:
        bool validation = _validateBookDetailsStep();

        if (validation) {
          pageIndex++;
        }

        emit(Start());
        break;
      case 1:
        bool validation = _validateProductDetailsStep();
        if (validation) pageIndex++;

        emit(Start());
        break;
      case 2:
        bool validation = _validatePaymentDetailsStep();
        if (validation) _addPost(emit);
        break;
    }
    emit(Start());
  }

  _update(AppEvents events, Emitter emit) {
    emit(Start());
  }

  //===========================
  //=========================== Book Details Step
  String? bookName;
  bool bookNameValidated = true;
  String? bookDescrabtion;
  bool bookDescrabtionValidated = true;
  List<File> bookImages = [];
  bool _validateBookDetailsStep() {
    bookNameValidated = bookName != null && bookName!.isNotEmpty;
    bookDescrabtionValidated = bookDescrabtion != null && bookDescrabtion!.isNotEmpty;
    return bookNameValidated && bookDescrabtionValidated;
  }

  //===========================
  //=========================== Product Details Step
  String? pageNumber;
  bool pageNumberValidated = true;
  String? bookWeight;
  bool bookWeightValidated = true;
  String? bookAuthor;
  bool bookAuthorValidated = true;
  File? authoImage;
  SelectOption? bookLanguage;
  bool bookLanguageValidated = true;
  SelectOption? bookCategory;
  bool bookCategoryValidated = true;
  SelectOption? bookCondition;
  bool bookConditionValidated = true;
  bool _validateProductDetailsStep() {
    pageNumberValidated = pageNumber != null && pageNumber!.isNotEmpty;
    bookWeightValidated = bookWeight != null && bookWeight!.isNotEmpty;
    bookAuthorValidated = bookAuthor != null && bookAuthor!.isNotEmpty;
    bookLanguageValidated = bookLanguage != null;
    bookCategoryValidated = bookCategory != null;
    bookConditionValidated = bookCondition != null;
    return pageNumberValidated && bookWeightValidated && bookAuthorValidated && bookLanguageValidated && bookCategoryValidated && bookConditionValidated;
  }

  //===========================
  //=========================== Payment Details Step
  String? phone;
  bool phoneValidated = true;
  LocationData? location;
  SelectOption? paymentMethod;
  bool paymentMethodValidated = true;
  bool _validatePaymentDetailsStep() {
    phoneValidated = phone != null && phone!.isNotEmpty;
    paymentMethodValidated = paymentMethod != null;
    return phoneValidated && paymentMethodValidated;
  }

  //===========================
  //===========================
  _addPost(Emitter emit) {
    emit(Loading());
    // TODO: add post
    emit(Done());
  }
}
