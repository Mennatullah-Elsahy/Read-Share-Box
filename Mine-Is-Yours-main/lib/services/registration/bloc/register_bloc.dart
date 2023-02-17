import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/app_core.dart';
import '../../../core/app_event.dart';
import '../../../core/app_notification.dart';
import '../../../core/app_state.dart';
import '../../../core/validator.dart';
import '../../../network/firebase_auth.dart';
import '../../../routes/routes.dart';
import '../../home/blocs/category_bloc.dart';
import '../../home/blocs/home_bloc.dart';

class RegisterBloc extends Bloc<AppEvent, AppState> {
  final email = BehaviorSubject<String?>();
  final password = BehaviorSubject<String?>();
  final name = BehaviorSubject<String?>();
  final confirmPassword = BehaviorSubject<String?>();
  String generatedPassword = '';
  final condations = BehaviorSubject<bool?>();
  static RegisterBloc get instance => BlocProvider.of(RouterGenerator.navigatorState.currentContext!);

  RegisterBloc() : super(Start()) {
    updateCondations(false);
  }

  Function(String?) get updateName => name.sink.add;
  Function(bool?) get updateCondations => condations.sink.add;
  Function(String?) get updatePassword => password.sink.add;

  Function(String?) get updateConfirmPassword => confirmPassword.sink.add;
  Function(String?) get updateEmail => email.sink.add;

  Stream<String?> get nameStream => name.stream.asBroadcastStream();
  Stream<bool?> get condationsStream => condations.stream.asBroadcastStream();
  Stream<String?> get passwordStream => password.stream.asBroadcastStream();
  Stream<String?> get emailStream => email.stream.asBroadcastStream();

  Stream<String?> get confirmPasswordStream => confirmPassword.stream.asBroadcastStream();

  Stream<bool> get submitStream => Rx.combineLatest4(nameStream, emailStream, confirmPasswordStream, passwordStream, (a, b, c, d) {
        if (NameValidator.nameValidator(a as String) == null && EmailValidator.emailValidator(b as String) == null && PasswordValidator.passwordValidator(c as String?) == null && PasswordConfirmationValidator.passwordValidator(d as String, c as String) == null) {
          return true;
        }
        return false;
      });

  clear() {
    updateEmail(null);
    updatePassword(null);
    updateConfirmPassword(null);
    updateName(null);
  }

  @override
  Future<void> close() {
    email.close();
    password.close();
    confirmPassword.close();
    name.close();
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield Loading();
    try {
      if (event is Click) {
        //condations.valueOrNull!
        if (true) {
          await FirebaseAuthHelper.instance
            .register(
                email: email.valueOrNull ?? "",
                password: password.valueOrNull ?? "")
            .then((value) {
          CategoryBlock.instance.add(GetData());
          HomeBloc.instance.add(GetData());
          return RouterGenerator.push(Routes.home);
        });
        } else {
          AppCore.showSnackBar(notification: AppNotification(message: "Please agree to the terms", backgroundColor: AppColor.REJECTED, iconName: "fill-close-circle"));
          yield Error();
        }
      }
    } catch (e) {
      AppCore.showSnackBar(notification: AppNotification(message: e.toString(), backgroundColor: AppColor.REJECTED, iconName: "fill-close-circle"));
      yield Error();
    }
  }
}
