import 'package:flutter/material.dart';

import '../theme/media.dart';

class CustomPageBody extends StatelessWidget {
  const CustomPageBody({super.key, required this.body, this.appBar, this.floatingActionButton});
  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      body: SizedBox(
        width: MediaHelper.width,
        height: MediaHelper.height,
        child: body,
      ),
    );
  }
}
