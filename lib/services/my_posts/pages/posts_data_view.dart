import 'package:flutter/material.dart';

import '../../../routers/navigator.dart';
import '../../../routers/routers.dart';
import '../../../utilities/components/custom_page_body.dart';
import '../widgets/posts_card.dart';

class PostsDataView extends StatelessWidget {
  const PostsDataView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => CustomNavigator.push(Routes.addPost),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [const SizedBox(height: 24), ...List.generate(1, (index) => const PostCardView())],
            ),
          ),
        ),
      ),
    );
  }
}
