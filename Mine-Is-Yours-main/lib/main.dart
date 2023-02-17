import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mus_app/services/home/blocs/category_bloc.dart';
import 'package:mus_app/services/home/blocs/home_bloc.dart';
import 'package:mus_app/services/new_post/blocs/new_post_bloc.dart';
import 'package:mus_app/services/registration/bloc/login_bloc.dart';
import 'package:mus_app/services/registration/bloc/register_bloc.dart';
import 'firebase_options.dart';
import 'routes/routes.dart';
import 'services/new_post/pages/new_post.dart';
import 'package:flutter_bloc/src/bloc_provider.dart' show BlocProvider, BlocProviderSingleChildWidget;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ProviderList.providers,
      child: MaterialApp(
        title: 'Mine Is Yours',
        initialRoute: Routes.onBoarding,
        navigatorKey: RouterGenerator.navigatorState,
        onGenerateRoute: RouterGenerator.generateRoutes,
        scaffoldMessengerKey: RouterGenerator.scaffoldState,
        navigatorObservers: [RouterGenerator.routeObserver],
        debugShowCheckedModeBanner: false,

        // home: NewPostPage(),
      ),
    );
  }
}

abstract class ProviderList {
  static List<BlocProviderSingleChildWidget> providers = [
    BlocProvider<NewPostBloc>(create: (_) => NewPostBloc()),
    BlocProvider<CategoryBlock>(create: (_) => CategoryBlock()),
    BlocProvider<HomeBloc>(create: (_) => HomeBloc()),
    BlocProvider<SignInBloc>(create: (_) => SignInBloc()),
    BlocProvider<RegisterBloc>(create: (_) => RegisterBloc(),)
  ];
}
