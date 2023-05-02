import 'package:flutter_bloc/src/bloc_provider.dart' show BlocProvider, BlocProviderSingleChildWidget;

import '../services/search/blocs/search_cubit.dart';

abstract class ProviderList {
  static List<BlocProviderSingleChildWidget> providers = [
    // BlocProvider<LangBloc>(create: (_) => LangBloc()),
    BlocProvider<SearchCubit>(create: (_) => SearchCubit()),
  ];
}
