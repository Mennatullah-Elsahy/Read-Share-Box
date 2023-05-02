import 'package:flutter/material.dart';
import 'package:mus_app/core/flutter_flow/flutter_flow.dart';
import 'package:mus_app/pages/auth/create_account_screen.dart';
import 'package:mus_app/pages/auth/forget_password_screen.dart';
import 'package:mus_app/pages/books/new_book.dart';
import 'package:mus_app/pages/drawer/about_us.dart';
import 'package:mus_app/pages/drawer/my_exchanges.dart';
import 'package:mus_app/pages/drawer/offers.dart';
import 'package:mus_app/pages/drawer/recommendations.dart';
import 'package:mus_app/pages/get_started_screen.dart';
import 'package:mus_app/pages/auth/login_screen.dart';
import 'package:mus_app/pages/home.dart';
import 'package:mus_app/pages/payment.dart';
import 'package:mus_app/pages/profile/complete_profile.dart';
import 'package:mus_app/pages/profile/my_profile.dart';
import 'package:mus_app/pages/search.dart';
import 'package:mus_app/services/book_posts/pages/book_posts.dart';
import 'package:mus_app/services/home/models/post_model.dart';
import 'package:mus_app/services/home/pages/home_page.dart';
import 'package:mus_app/services/new_post/pages/new_post.dart';
import 'package:mus_app/services/post_details/pages/post_details.dart';
import 'package:mus_app/services/splash/pages/splash_page.dart';

import '../services/registration/pages/login_page.dart';
import '../services/registration/pages/register_page.dart';

class Routes {
  static const login = "/";
  static const register = "/register";
  static const createAccount = "/signup";
  static const forgetPassword = "/forget-password";
  static const onBoarding = "/onboarding";
  static const home = "/home";
  static const search = "/search";
  static const myProfile = "/profile";
  static const completeProfile = "/complete-profile";
  static const aboutUs = "/about-us";
  static const myExchanges = "/exchanges";
  static const offers = "/offers";
  static const recommendation = "/recommendation";
  static const payment = "/payment";
  static const newBook = "/new-book";
  static const bookDetails = "/book-details";
  static const takingBooks = "/taking-books";
  static const getStarted = "/get-started";
}

class RouterGenerator {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return PageTransition(
            child: const LoginPage(), type: PageTransitionType.fade);
      case Routes.getStarted:
        return PageTransition(
            child: const GetStartedPage(), type: PageTransitionType.fade);
      case Routes.takingBooks:
        return PageTransition(
            child: const BookPostsPage(), type: PageTransitionType.fade);
      
      case Routes.onBoarding:
        return PageTransition(
            child: const Splash(), type: PageTransitionType.fade);
      case Routes.createAccount:
        return PageTransition(
            child: const CreateAccountScreen(),
            type: PageTransitionType.leftToRight);
      case Routes.register:
        return PageTransition(
            child: const RegisterPage(),
            type: PageTransitionType.leftToRight);
      
      case Routes.forgetPassword:
        return PageTransition(
            child: const ForgetPasswordScreen(),
            type: PageTransitionType.bottomToTop);
      case Routes.home:
        return PageTransition(
            child: const HomePage(), type: PageTransitionType.fade);
      case Routes.search:
        return PageTransition(
            child: const SearchScreen(), type: PageTransitionType.leftToRight);
      case Routes.myProfile:
        return PageTransition(
            child: const MyProfileScreen(),
            type: PageTransitionType.leftToRight);
      case Routes.completeProfile:
        return PageTransition(
            child: const CompleteProfileScreen(),
            type: PageTransitionType.bottomToTop);
      case Routes.aboutUs:
        return PageTransition(
            child: const AboutUsScreen(), type: PageTransitionType.leftToRight);
      case Routes.myExchanges:
        return PageTransition(
            child: const MyExchangesScreen(),
            type: PageTransitionType.leftToRight);
      case Routes.offers:
        return PageTransition(
            child: const OffersScreen(), type: PageTransitionType.leftToRight);
      case Routes.recommendation:
        return PageTransition(
            child: const RecommendationScreen(),
            type: PageTransitionType.leftToRight);
      case Routes.payment:
        return PageTransition(
            child: const PaymentScreen(), type: PageTransitionType.bottomToTop);
      case Routes.newBook:
        return PageTransition(
            child: const NewPostPage(), type: PageTransitionType.bottomToTop);
      case Routes.bookDetails:
        return PageTransition(
            child: PostDetails(post: settings.arguments as PostModel), type: PageTransitionType.bottomToTop);
      default:
        return MaterialPageRoute(
          builder: ((context) => const GetStartedPage()),
        );
    }
  }
   static pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static push(String routeName,
      {arguments, bool replace = false, bool clean = false}) {
    if (clean) {

      return navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (_) => false,
          arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
