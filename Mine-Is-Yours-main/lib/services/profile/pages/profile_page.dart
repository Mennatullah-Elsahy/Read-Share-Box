import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mus_app/components/animated_widgets.dart';
import 'package:mus_app/helpers/media_query_helper.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQueryHelper.width,
        height: MediaQueryHelper.height,
        child: ListAnimator(
          data: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(""),fit: BoxFit.contain)
              ),
              width: 60,
              height: 60,
            ),
          ],
        )
      ),
    );
  }
}