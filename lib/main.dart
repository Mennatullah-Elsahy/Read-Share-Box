import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:read_share_box/routers/navigator.dart';
import 'package:read_share_box/routers/routers.dart';
import 'package:read_share_box/utilities/theme/colors.dart';
import 'base/blocs/settings_bloc.dart';
import 'config/app_states.dart';
import 'handlers/localization_handler.dart';
import 'handlers/shared_handler.dart';
import 'network/network_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHandler.init();
  NetworkHandler.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: const Launch(),
    );
  }
}

class Launch extends StatelessWidget {
  const Launch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var settingsBloc = BlocProvider.of<SettingsBloc>(context);
    return BlocBuilder<SettingsBloc, AppStates>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Project Title',
          theme: ColoresThemes().mapColor(settingsBloc.settingsModel.theme, "amiri_quran"),
          debugShowCheckedModeBanner: false,
          // initialRoute: Routes.splash,
          navigatorKey: CustomNavigator.navigatorState,
          navigatorObservers: [CustomNavigator.routeObserver],
          scaffoldMessengerKey: CustomNavigator.scaffoldState,
          onGenerateRoute: CustomNavigator.onCreateRoute,
          // home: MyRequestsPage(),
          initialRoute: Routes.home,

          // to tell the app what the language should support
          supportedLocales: const [Locale("en"), Locale("ar")],

          // to tell the app what the components should follow the determined language
          localizationsDelegates: const [
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          // this is a callback, it's executed when the user open the app or change the localaization of the mobile
          // what is its jop?
          // : it cheks if what is the current language of the mobile and return it for the app to follow it
          // : it cheks too if the user specified any language he need even if it's not same as the mobile language is
          // localeResolutionCallback: (currentLang, supportedLangs) {
          //   // String? savedLgnCode = pref!.getString("lgnCode");
          //   if (currentLang != null) {
          //     for (Locale locale in supportedLangs) {
          //       if (locale.languageCode == currentLang.languageCode) return locale;
          //     }
          //   }
          //   return supportedLangs.first;
          // },
          locale: Locale(settingsBloc.settingsModel.lang),
        );
      },
    );
  }
}
