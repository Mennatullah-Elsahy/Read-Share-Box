import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/widgets/fields/images_input_field.dart';
import '../../../base/widgets/fields/text_descrabtion_input_field.dart';
import '../../../base/widgets/fields/text_input_field.dart';
import '../../../config/app_events.dart';
import '../../../config/app_states.dart';
import '../bloc/add_post_bloc.dart';

class BookDetailsStep extends StatelessWidget {
  const BookDetailsStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AddPostBloc>(context);
    return BlocBuilder<AddPostBloc, AppStates>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextInputField(
                labelText: "Book Name",
                hintText: "Enter book name",
                initialValue: bloc.bookName,
                onChange: (value) {
                  bloc.bookName = value;
                  bloc.bookNameValidated = true;
                  bloc.add(Update());
                },
                hasError: !bloc.bookNameValidated,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextDescrabtionInputField(
                labelText: "Book Description",
                hintText: "Enter book description",
                initialValue: bloc.bookDescrabtion,
                onChange: (value) {
                  bloc.bookDescrabtion = value;
                  bloc.bookDescrabtionValidated = true;
                  bloc.add(Update());
                },
                hasError: !bloc.bookDescrabtionValidated,
              ),
            ),
            ImagesListInputField(
              labelText: "Book Images",
              withBottomPadding: true,
              initialValue: bloc.bookImages,
              onChange: (value) => value != null ? bloc.bookImages = value : null,
            ),
          ],
        );
      },
    );
  }
}
