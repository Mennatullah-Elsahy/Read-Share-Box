import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mus_app/components/animated_widgets.dart';
import 'package:mus_app/core/app_event.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/helpers/app_text_styles.dart';
import 'package:mus_app/helpers/media_query_helper.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/blocs/category_bloc.dart';
import 'package:mus_app/services/home/blocs/home_bloc.dart';
import 'package:mus_app/services/new_post/widgets/custom_btn.dart';

import '../../../components/custom_icon.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    Timer(Duration(seconds: 3), () {
      //  SplashBloc.instance.add(Click());
      RouterGenerator.push(Routes.getStarted);
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        key: Key("root"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //     padding: EdgeInsets.symmetric(vertical: 70.0),
            //     child: RichText(
            //       text: TextSpan(text: "coursafer App",  style: TextStyle(
            //           fontSize: 15,
            //           fontWeight: FontWeight.w500,
            //           color: Styles.WHITE_COLOR)),
            //     )),
            Expanded(
              child: AnimatedWidgets(
                durationMilli: 2000.0,
                verticalOffset: 0.0,
                horizontalOffset: 0.0,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("MUS",
                      style: AppTextStyles.w700
                          .copyWith(fontSize: 36, color: Colors.white)),
                  const SizedBox(width: 25),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: RichText(
                text: const TextSpan(
                  text: "Powerd By",
                  children: [
                    TextSpan(
                      text: " MUS",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  ],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
