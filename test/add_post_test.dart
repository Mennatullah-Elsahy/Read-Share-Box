import 'package:read_share_box/services/add_posts/bloc/add_post_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('Product Details Step 1 Testing', () {
    AddPostBloc bloc = AddPostBloc();
    test(
      "book name",
      () {
        bloc.bookName = "Mohamed";
        expect("Mohamed", bloc.bookName);
        expect(true, bloc.bookNameValidated);
        bloc.bookNameValidated = false;
        expect(false, bloc.bookNameValidated);
        bloc.bookNameValidated = true;
        expect(true, bloc.bookNameValidated);
      },
    );
    test(
      "book discribtion",
      () {
        bloc.bookDescrabtion = "Fatakat anywhere";
        expect("Fatakat anywhere", bloc.bookDescrabtion);
        expect(true, bloc.bookDescrabtionValidated);
        bloc.bookDescrabtionValidated = false;
        expect(false, bloc.bookDescrabtionValidated);
        bloc.bookDescrabtionValidated = true;
        expect(true, bloc.bookDescrabtionValidated);
      },
    );
  });
}
