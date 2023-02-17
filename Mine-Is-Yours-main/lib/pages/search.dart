import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mus_app/components/animated_widgets.dart';
import 'package:mus_app/components/empty_container.dart';
import 'package:mus_app/helpers/app_text_styles.dart';
import 'package:mus_app/helpers/media_query_helper.dart';
import 'package:mus_app/services/home/models/post_model.dart';

import '../core/app_state.dart';
import '../core/flutter_flow/flutter_flow_theme.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../routes/routes.dart';
import '../services/home/blocs/home_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? textController;
  double? ratingBarValue1;
  double? ratingBarValue2;
  double? ratingBarValue3;
  double? ratingBarValue4;
  double? ratingBarValue5;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: "Search here",
                filled: true,
                fillColor: const Color(0xffF9F9FA),
                prefixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: BlocBuilder<HomeBloc, AppState>(
                builder: (context, state) {
                  if (state is Done) {
                    List<PostModel> data = state.data as List<PostModel>;
                    return Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Search Results :',
                              style: AppTextStyles.w400.copyWith(
                                  fontSize: 18, color: Color(0xff7F8B93)),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              data.length.toString(),
                              style: AppTextStyles.w600.copyWith(
                                  fontSize: 18, color: Color(0xff7F8B93)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: ListAnimator(
                            data: List.generate(
                              data.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(10),
                                child: InkWell(
                                  onTap: () async {
                                    await RouterGenerator.push(
                                        Routes.bookDetails,
                                        arguments: data[index]);
                                  },
                                  child: Container(
                                    height: 150,
                                    width: MediaQueryHelper.width,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Hero(
                                            tag: data[index].book!.id!,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child: Image.network(
                                                data[index].book!.image!,
                                                width: 130,
                                                height: 140,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 24),
                                              Text(
                                                data[index].book!.title!,
                                                style: AppTextStyles.w700
                                                    .copyWith(fontSize: 20),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                              const SizedBox(height: 16),
                                              Expanded(
                                                child: Text(
                                                  data[index]
                                                          .book!
                                                          .describtion ??
                                                      "",
                                                  style: AppTextStyles.w400
                                                      .copyWith(
                                                          fontSize: 16,
                                                          color: Colors.grey),
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else
                    return EmptyContainer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
