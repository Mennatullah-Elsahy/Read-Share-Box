import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/app_states.dart';
import '../blocs/search_cubit.dart';
import '../widgets/grid_book_store_card.dart';
import '../widgets/list_book_store_card.dart';
import '../widgets/search_appBar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<SearchCubit>();
    return SafeArea(
      child: BlocBuilder<SearchCubit, AppStates>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              //================================= Search Bar =================================
              //==============================================================================
              //==============================================================================
              SearchAppBar(
                onListTap: () => bloc.changeView(),
                onFilterTap: () {},
                isGrid: !bloc.showAsGrid,
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: AnimatedCrossFade(
                  firstChild: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 16),
                    itemBuilder: (context, index) => Chip(
                      label: const Text("Fitler"),
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.white),
                    ),
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 500),
                ),
              ),
              //=============================== Books Results ================================
              //==============================================================================
              //==============================================================================
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(height: 0, color: Colors.grey, thickness: .2),
              ),
              Expanded(
                child: bloc.showAsGrid
                    ? SingleChildScrollView(
                        padding: EdgeInsets.only(top: 16),
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: List.generate(5, (index) => ListBookStoreCardView()),
                          ),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: .57),
                        itemBuilder: (context, index) => GridBookStoreCardView(),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
