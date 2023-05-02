import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../base/models/select_option.dart';
import '../../../base/widgets/fields/image_input_field.dart';
import '../../../base/widgets/fields/single_select_bottomsheet/single_select_input_field.dart';
import '../../../config/app_events.dart';
import '../../../config/app_states.dart';
import '../bloc/add_post_bloc.dart';
import '../widgets/single_select_field.dart';
import '../../../base/widgets/fields/text_input_field.dart';

class BookProductStep extends StatelessWidget {
  const BookProductStep({
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
              child: Row(
                children: [
                  Expanded(
                    child: TextInputField(
                      labelText: "Page Number",
                      hintText: "Enter page number",
                      keyboardType: TextInputType.number,
                      initialValue: bloc.pageNumber,
                      onChange: (value) {
                        bloc.pageNumber = value;
                        bloc.pageNumberValidated = true;
                        bloc.add(Update());
                      },
                      hasError: !bloc.pageNumberValidated,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextInputField(
                      labelText: "Book Weight",
                      hintText: "Enter book weight",
                      keyboardType: TextInputType.number,
                      initialValue: bloc.bookWeight,
                      onChange: (value) {
                        bloc.bookWeight = value;
                        bloc.bookWeightValidated = true;
                        bloc.add(Update());
                      },
                      hasError: !bloc.bookWeightValidated,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleSelectSheetField(
                labelText: "Book Category",
                hintText: "Select book category",
                withBottomPadding: true,
                initialValue: bloc.bookCategory,
                hasError: !bloc.bookCategoryValidated,
                onChange: (option) {
                  bloc.bookCategory = option;
                  bloc.bookCategoryValidated = true;
                  bloc.add(Update());
                },
                valueSet: [SelectOption("1", "Education"), SelectOption("2", "Fantasy")],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleSelectSheetField(
                labelText: "Book Language",
                hintText: "Select book language",
                withBottomPadding: true,
                initialValue: bloc.bookLanguage,
                hasError: !bloc.bookLanguageValidated,
                onChange: (option) {
                  bloc.bookLanguage = option;
                  bloc.bookLanguageValidated = true;
                  bloc.add(Update());
                },
                valueSet: [SelectOption("english", "English"), SelectOption("arabic", "Arabic")],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextInputField(
                labelText: "Book Author",
                hintText: "Enter book author name",
                initialValue: bloc.bookAuthor,
                onChange: (value) {
                  bloc.bookAuthor = value;
                  bloc.bookAuthorValidated = true;
                  bloc.add(Update());
                },
                hasError: !bloc.bookAuthorValidated,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ImageInputField(
                labelText: "Author Image",
                initialValue: bloc.authoImage,
                onChange: (value) {
                  bloc.authoImage = value;
                  bloc.add(Update());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleSelectField(
                labelText: "Book Condition",
                valueSet: [
                  SelectOption("new", "New"),
                  SelectOption("used", "Used"),
                ],
                initialValue: bloc.bookCondition,
                onSelect: (option) {
                  bloc.bookCondition = option;
                  bloc.bookConditionValidated = true;
                  bloc.add(Update());
                },
                hasError: !bloc.bookConditionValidated,
              ),
            )
          ],
        );
      },
    );
  }
}
