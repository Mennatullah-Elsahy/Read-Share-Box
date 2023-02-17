import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mus_app/network/firebase_auth.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/blocs/category_bloc.dart';
import 'package:mus_app/services/home/blocs/home_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../../core/app_core.dart';
import '../../../core/app_event.dart';
import '../../../core/app_notification.dart';
import '../../../core/app_state.dart';
import '../../../core/validator.dart';
import '../../../helpers/app_colors.dart';

class SignInBloc extends Bloc<AppEvent, AppState> {
  static SignInBloc get instance =>
      BlocProvider.of(RouterGenerator.navigatorState.currentContext!);

  SignInBloc() : super(Start());
  final email = BehaviorSubject<String?>();
  final password = BehaviorSubject<String?>();
  final rememberMe = BehaviorSubject<bool?>();
  bool remebered = false;
  Function(String?) get updateEmail => email.sink.add;

  Function(String?) get updatePassword => password.sink.add;
  Function(bool?) get updateRememberMe => rememberMe.sink.add;

  Stream<String?> get emailStream => email.stream.asBroadcastStream();

  Stream<String?> get passwordStream => password.stream.asBroadcastStream();
  Stream<bool?> get rememberMeStream => rememberMe.stream.asBroadcastStream();
  Stream<bool> get submitStream =>
      Rx.combineLatest2(emailStream, passwordStream, (n, p) {
        if (NameValidator.nameValidator(n as String?) == null &&
            PasswordValidator.passwordValidator(p as String?) == null) {
          return true;
        }
        return false;
      });

  clear() {
    updateEmail(null);
    updatePassword(null);
    updateRememberMe(null);
  }

  @override
  Future<void> close() {
    email.close();
    password.close();
    updateRememberMe(false);
    return super.close();
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    yield Loading();
    try {
      if (event is Click) {
        // UserModel model = await RegistrationRepo.signIn(
        //   data: FormData.fromMap(
        //     {"email": email.valueOrNull, "password": password.valueOrNull},
        //   ),
        // );

        await FirebaseAuthHelper.instance
            .login(
                email: email.valueOrNull ?? "",
                password: password.valueOrNull ?? "")
            .then((value) {
          CategoryBlock.instance.add(GetData());
          HomeBloc.instance.add(GetData());
          return RouterGenerator.push(Routes.home);
        });

        yield Done();
      }
    } on FirebaseAuthException catch (e) {
      print("lol");
      AppCore.showSnackBar(
        notification: AppNotification(
            message: e.message ?? "",
            backgroundColor: AppColor.REJECTED,
            iconName: "fill-close-circle"),
      );
      yield Error();
    } catch (e) {
      print("object");
      AppCore.showSnackBar(
          notification: AppNotification(
              message: e.toString(),
              backgroundColor: AppColor.REJECTED,
              iconName: "fill-close-circle"));
      yield Error();
    }
  }
}
