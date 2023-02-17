import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mus_app/components/animated_widgets.dart';
import 'package:mus_app/core/app_state.dart';
import 'package:mus_app/helpers/app_text_styles.dart';
import 'package:mus_app/services/book_posts/widgets/list_book_item.dart';
import 'package:mus_app/services/home/blocs/home_bloc.dart';

import '../../../helpers/media_query_helper.dart';
import '../../../routes/routes.dart';

class BookPostsPage extends StatelessWidget {
  const BookPostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Builder(builder: (context) {
          return InkWell(
            onTap: () => RouterGenerator.pop(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          );
        }),
        title: Text(
          "Books",
          style: AppTextStyles.w800.copyWith(fontSize: 24),
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: SizedBox(
            width: MediaQueryHelper.width,
            height: MediaQueryHelper.height,
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<HomeBloc, AppState>(
                    builder: (context, state) {
                      if (state is Done) {
                        return ListAnimator(
                          data: List.generate(
                            state.data!.length,
                            (index) => ListBookItem(
                              post: state.data![index],
                            ),
                          ),
                        );
                      } else if (state is Loading)
                        return CircularProgressIndicator();
                      else
                        return Center(
                          child: Text(
                            "There is no posts",
                            style: AppTextStyles.w600.copyWith(fontSize: 24),
                          ),
                        );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
