import 'package:read_share_box/services/search/blocs/search_cubit.dart';
import 'package:test/test.dart';

void main() {
  group(
    "Search Testing cases",
    () {
      SearchCubit cubit = SearchCubit();
      test(
        "keyword value",
        () {
          cubit.search("Mohamed");
          expect("Mohamed", cubit.searchKeyWork);
        },
      );
      test(
        "items viwe",
        () {
          expect(false, cubit.showAsGrid);
          cubit.changeView();
          expect(true, cubit.showAsGrid);
          cubit.changeView();
          expect(false, cubit.showAsGrid);
        },
      );
    },
  );
}
