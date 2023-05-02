import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_states.dart';
import '../../../../debug/log_printer.dart';

class RegisterCubit extends Cubit<AppStates> {
  RegisterCubit() : super(Start());

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? dateOfBirth;
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void register() {
    log_data(label: "register data", message: "data");
    emit(Loading());
    try {
      Map<String, dynamic> data = {
        "name": name.text,
        "email": email.text,
        "phone": phone.text,
        "dateOfBirth": dateOfBirth,
        "password": password.text,
        "confirmPassword": confirmPassword.text,
      };
      log_data(label: "register data", message: data);
      emit(Done());
    } catch (e) {
      emit(Error());
    }
  }
}
