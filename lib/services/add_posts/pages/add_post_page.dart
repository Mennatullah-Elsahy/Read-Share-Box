import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_share_box/services/add_posts/pages/payment_details_step.dart';
import '../../../config/app_events.dart';
import '../../../config/app_states.dart';
import '../../../utilities/components/custom_btn.dart';
import '../../../utilities/components/custom_page_body.dart';
import '../bloc/add_post_bloc.dart';
import '../widgets/indicator_header.dart';
import 'book_details_step.dart';
import 'book_product_step.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  _mapScreen(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return const BookDetailsStep();
      case 1:
        return const BookProductStep();
      case 2:
        return const PaymentDetailsStep();
    }
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AddPostBloc>(context);
    return BlocBuilder<AddPostBloc, AppStates>(
      builder: (context, state) {
        return CustomPageBody(
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                IndicatorHeader(
                  totalSteps: 3,
                  progress: bloc.pageIndex + 1,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: _mapScreen(bloc.pageIndex),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                  child: Row(
                    children: [
                      Visibility(
                        visible: bloc.pageIndex != 0,
                        child: Expanded(
                          child: CustomBtn(
                            text: "Back",
                            buttonColor: Colors.transparent,
                            borderColor: Theme.of(context).colorScheme.primary,
                            radius: 8,
                            textColor: Theme.of(context).colorScheme.primary,
                            onTap: () => bloc.add(Previous()),
                          ),
                        ),
                      ),
                      AnimatedSize(duration: const Duration(milliseconds: 500), child: SizedBox(width: bloc.pageIndex != 0 ? 16 : 0)),
                      Expanded(
                        child: CustomBtn(
                          text: bloc.pageIndex != 2 ? "Next" : "Submit",
                          radius: 8,
                          textColor: Colors.white,
                          onTap: () => bloc.add(Next()),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
