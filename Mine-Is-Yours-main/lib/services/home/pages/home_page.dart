import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mus_app/components/animated_widgets.dart';
import 'package:mus_app/core/app_state.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/helpers/app_text_styles.dart';
import 'package:mus_app/helpers/media_query_helper.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/blocs/category_bloc.dart';
import 'package:mus_app/services/home/blocs/home_bloc.dart';
import 'package:mus_app/services/home/widgets/section_title.dart';
import 'package:mus_app/services/new_post/widgets/custom_btn.dart';

import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../widgets/book_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 16,
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 5),
                child: Container(
                  width: 100,
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/999/600',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 30),
                child: Text(
                  'User Name' /* User Name */,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Libre Baskerville',
                        color: Colors.black,
                        fontSize: 25,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -0.35),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 11, 3),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.pushNamed(context, '/profile');
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.location_history,
                        color: Colors.black,
                        size: 40,
                      ),
                      title: Text(
                        'Profile' /* Profile */,
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Libre Baskerville',
                              color: Colors.black,
                              fontSize: 20,
                            ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 26,
                      ),
                      tileColor: const Color(0xFFF5F5F5),
                      dense: false,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(8, 14, 0, 14),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 11, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/offers');
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.credit_card,
                      color: Colors.black,
                      size: 40,
                    ),
                    title: Text(
                      'My Plan' /* My Plan */,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Libre Baskerville',
                            color: const Color(0xFF010101),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 26,
                    ),
                    tileColor: const Color(0xFFF5F5F5),
                    dense: false,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(8, 14, 0, 14),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 11, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/exchanges');
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.swap_horiz,
                      color: Colors.black,
                      size: 40,
                    ),
                    title: Text(
                      'Exchanges' /* Exchanges */,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Libre Baskerville',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 26,
                    ),
                    tileColor: const Color(0xFFF5F5F5),
                    dense: false,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(8, 14, 0, 14),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 11, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/recommendation');
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.recommend,
                      color: Colors.black,
                      size: 40,
                    ),
                    title: Text(
                      'Recommendation' /* Recommendations */,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Libre Baskerville',
                            color: Colors.black,
                            fontSize: 19,
                          ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 26,
                    ),
                    tileColor: const Color(0xFFF5F5F5),
                    dense: false,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(8, 14, 0, 14),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 11, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/about-us');
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.people_alt_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                    title: Text(
                      'About Us' /* About Us */,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Libre Baskerville',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 26,
                    ),
                    tileColor: const Color(0xFFF5F5F5),
                    dense: false,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(8, 14, 0, 14),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(6, 0, 11, 0),
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushNamed(context, '/onboarding');
                  },
                  child: ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 40,
                    ),
                    title: Text(
                      'Log Out' /* Log Out */,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Libre Baskerville',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 26,
                    ),
                    tileColor: Colors.black,
                    dense: false,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(8, 14, 0, 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Builder(builder: (context) {
          return InkWell(
            onTap: () => Scaffold.of(context).openDrawer(),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          );
        }),
        title: Text(
          "Mine Is Yours",
          style: AppTextStyles.w800.copyWith(fontSize: 24),
        ),
        actions: [
          InkWell(
            onTap: () => RouterGenerator.push(Routes.search),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
      body: SizedBox(
        height: MediaQueryHelper.height,
        width: MediaQueryHelper.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListAnimator(
            data: [
              BlocBuilder<HomeBloc, AppState>(builder: (context, state) {
                if (state is Done) {
                  return Column(
                    children: [
                      const SectionTitle(title: 'Recently Given Books'),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 200,
                        width: MediaQueryHelper.width,
                        child: ListAnimator(
                          direction: Axis.horizontal,
                          data: state.cards,
                        ),
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              }),
              BlocBuilder<CategoryBlock, AppState>(builder: (context, state) {
                if (state is Done) {
                  return Column(
                    children: [
                      SectionTitle(title: 'Book Categories'),
                      SizedBox(height: 24),
                      SizedBox(
                        height: 120,
                        child: MasonryGridView.count(
                          // axisDirection: AxisDirection.right,
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          itemCount: state.cards!.length,
                          // childAspectRatio: 1/3.5,
                          itemBuilder: (context, index) => state.cards![index],
                        ),
                      ),
                    ],
                  );
                } else if (state is Loading) {
                  return CircularProgressIndicator();
                } else {
                  return SizedBox();
                }
              }),
              SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                    child: Text(
                  "Exchange your book",
                  style: AppTextStyles.w800.copyWith(fontSize: 32),
                )),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomBtn(
                      onTap: () => RouterGenerator.push(Routes.newBook),
                      text: "Giving",
                      icon: FontAwesomeIcons.turnUp,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomBtn(
                      onTap: () => RouterGenerator.push(Routes.takingBooks),
                      text: "Taking",
                      icon: FontAwesomeIcons.turnDown,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.value,
  }) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(right: 8, top: 5, left: 5, bottom: 5),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(child: Text(value)),
    );
  }
}
