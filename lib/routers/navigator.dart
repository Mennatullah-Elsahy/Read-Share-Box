import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_share_box/routers/routers.dart';
import '../base/pages/base_page.dart';
import '../config/app_blocs_provider.dart';
import '../handlers/qr_code_scanner/qr_scanner_view.dart';
import '../services/add_posts/bloc/add_post_bloc.dart';
import '../services/add_posts/pages/add_post_page.dart';
import '../services/authentication/login/pages/login_page.dart';
import '../services/authentication/register/blocs/register_bloc.dart';
import '../services/authentication/register/pages/register_page.dart';
import '../services/mus_store/pages/mus_store_page.dart';
import '../services/my_requests/pages/my_requests_page.dart';
import '../services/notificatins/pages/notificatino_page.dart';
import '../services/points_details/pages/points_details_page.dart';
import '../services/post_details/pages/owner_post_detilas_page.dart';
import '../services/post_details/pages/user_post_details.dart';
import '../services/splash/pages/splash_page.dart';
import '../services/user_requests/pages/user_requests_page.dart';

const begin = Offset(0.0, 1.0);
const end = Offset.zero;
const curve = Curves.easeInOut;
var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState = GlobalKey<ScaffoldMessengerState>();

  static _pageRoute(Widget screen) => PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return _pageRoute(const LoginPage());
      case Routes.register:
        return _pageRoute(BlocProvider(create: (context) => RegisterCubit(), child: const RegisterPage()));
      case Routes.splash:
        return _pageRoute(const SplashPage());
      case Routes.qrScannerCode:
        return _pageRoute(const QrCodeScannerView());
      case Routes.home:
        return _pageRoute(MultiBlocProvider(
          providers: ProviderList.providers,
          child: BasePage(),
        ));
      case Routes.ownerPostDetails:
        return _pageRoute(const OwnerPostDetailsPage());
      case Routes.notifications:
        return _pageRoute(const NotificationsPage());
      case Routes.musStore:
        return _pageRoute(const MusShopPage());
      case Routes.myRequests:
        return _pageRoute(const MyRequestsPage());
      case Routes.userPostDetails:
        return _pageRoute(const UserPostDetailsPage());
      case Routes.userRequests:
        return _pageRoute(const UserRequestsPage());
      case Routes.pointsDetails:
        return _pageRoute(const PointsDetailsPage());
      case Routes.addPost:
        return _pageRoute(
          BlocProvider(
            create: (context) => AddPostBloc(),
            child: const AddPostPage(),
          ),
        );
    }
    return MaterialPageRoute(builder: (_) => Container());
  }

  static pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static push(String routeName, {arguments, bool replace = false, bool clean = false}) {
    if (clean) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!.pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }
}
