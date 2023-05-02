import 'package:flutter/material.dart';

import '../../../base/pages/empty_page.dart';
import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';
import '../../../utilities/components/custom_btn.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyPage(
      body: CustomBtn(
        text: "Add Post",
        icon: const Icon(Icons.add, size: 16, color: Colors.white),
        height: 56,
        width: 200,
        onTap: () => CustomNavigator.push(Routes.addPost),
      ),
    );
  }
}
