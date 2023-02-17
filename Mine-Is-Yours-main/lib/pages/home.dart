import 'package:mus_app/core/flutter_flow/flutter_flow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/home/widgets/section_title.dart';
import 'books/book_details.dart';
import 'academic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
        title: Center(
            child: Text(
          "Mine Is Yours",
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 25,
              ),
        )),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
        centerTitle: true,
        elevation: 6,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SectionTitle(title: 'Recently Given Books'),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookDetailsWidget(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/photo_2022-10-19_20-42-53.jpg',
                            width: 120,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                        child: Image.asset(
                          'assets/images/photo_2022-10-19_20-42-53.jpg',
                          width: 120,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                        child: Image.asset(
                          'assets/images/photo_2022-10-19_20-42-53.jpg',
                          width: 120,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                        child: Image.asset(
                          'assets/images/photo_2022-10-19_20-42-53.jpg',
                          width: 120,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                        child: Image.asset(
                          'assets/images/photo_2022-10-19_20-42-53.jpg',
                          width: 120,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                        child: Image.asset(
                          'assets/images/photo_2022-10-19_20-42-53.jpg',
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: '',
                    options: FFButtonOptions(
                      width: 12,
                      height: 40,
                      color: Colors.black,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4, 8, 0, 8),
                    child: Text(
                      'Book Category' /* Book Category */,
                      style: FlutterFlowTheme.of(context).subtitle1.override(
                            fontFamily: 'Libre Baskerville',
                            color: Colors.black,
                            fontSize: 22,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Color(0xFF6839EF),
                        size: 0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Container(
                width: double.infinity,
                height: 110,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AcademicWidget(),
                            ),
                          );
                        },
                        child: Image.asset(
                          'assets/images/A1.jpg',
                          width: 180,
                          height: 60,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/A2.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/A3.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/B1.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/B2.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/C3.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/C2.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/C1.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/E1.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/H3.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/H1.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/H2.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/H4.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/H5.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/K1.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/L1.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/M1.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/P1.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/R1.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/fdsakhj.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/photo_2022-10-24_10-18-10.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/photo_2022-10-24_10-17-38.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/K2.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8, 0, 16, 0),
                      child: Image.asset(
                        'assets/images/B3.jpg',
                        width: 180,
                        height: 60,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 30),
              child: Text(
                'Exchange Your Books' /* Exchange Your Books */,
                style: FlutterFlowTheme.of(context).subtitle1.override(
                      fontFamily: 'Libre Baskerville',
                      color: const Color(0xFF2D3436),
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          Navigator.pushNamed(context, '/new-book');
                        },
                        text: 'Giving' /* Giving */,
                        icon: const FaIcon(
                          FontAwesomeIcons.turnUp,
                          size: 36,
                        ),
                        options: FFButtonOptions(
                          width: 190,
                          height: 70,
                          color: Colors.black,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Libre Baskerville',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(-0.55, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          Navigator.pushNamed(context, '/search');
                        },
                        text: 'Taking' /* Taking */,
                        icon: const FaIcon(
                          FontAwesomeIcons.turnDown,
                          size: 36,
                        ),
                        options: FFButtonOptions(
                          width: 190,
                          height: 70,
                          color: Colors.black,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: 'Libre Baskerville',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                          borderSide: const BorderSide(
                            width: 5,
                          ),
                          borderRadius: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

