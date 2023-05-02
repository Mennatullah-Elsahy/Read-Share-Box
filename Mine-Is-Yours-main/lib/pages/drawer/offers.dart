import 'package:mus_app/core/flutter_flow/flutter_flow.dart';
import 'package:flutter/material.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  bool radioListTileValue1 = false;
  bool radioListTileValue2 = false;
  bool radioListTileValue3 = false;
  bool radioListTileValue4 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
        title: Text(
          'Offers / Plans' /* Offers / Plans */,
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 25,
              ),
        ),
        centerTitle: false,
        elevation: 6,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Your Subscription' /* Your Subscription */,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x34111417),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor: const Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: radioListTileValue1,
                            onChanged: (newValue) async {
                              setState(() {
                                radioListTileValue2 = !newValue!;
                                radioListTileValue3 = !newValue;
                                radioListTileValue4 = !newValue;

                                radioListTileValue1 = newValue;
                              });
                            },
                            title: Text(
                              'Monthly' /* Monthly */,
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            subtitle: Text(
                              '\$15.99/mo' /* $15.99/mo */,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            checkColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 0, 24, 0),
                          child: Text(
                            'Can post up to 15 books per month' /* Can post up to 15 books per mo... */,
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x34111417),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor: const Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: radioListTileValue2,
                            onChanged: (newValue) async {
                              setState(() {
                                radioListTileValue1 = !newValue!;
                                radioListTileValue3 = !newValue;
                                radioListTileValue4 = !newValue;
                                radioListTileValue2 = newValue;
                              });
                            },
                            title: Text(
                              'Annual (save \$12)' /* Annual (save $12) */,
                              style: FlutterFlowTheme.of(context).bodyText2,
                            ),
                            subtitle: Text(
                              '\$180/yr' /* $180/yr */,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            checkColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 0, 24, 0),
                          child: Text(
                            'Can post up to 180 book per year' /* Can post up to 180 book per ye... */,
                            style: FlutterFlowTheme.of(context).bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Other Offers' /* Other Offers */,
                      style: FlutterFlowTheme.of(context).bodyText2.override(
                            fontFamily: 'Poppins',
                            color: Colors.black,
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x34111417),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor: const Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: radioListTileValue3,
                            onChanged: (newValue) async {
                              setState(() {
                                radioListTileValue1 = !newValue!;
                                radioListTileValue2 = !newValue;
                                radioListTileValue4 = !newValue;

                                radioListTileValue3 = newValue;
                              });
                            },
                            title: Text(
                              '120 points' /* 120 points */,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            subtitle: Text(
                              '\$85 (get 15 free)' /* $85 (get 15 free) */,
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            checkColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x34111417),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            unselectedWidgetColor: const Color(0xFF95A1AC),
                          ),
                          child: CheckboxListTile(
                            value: radioListTileValue4,
                            onChanged: (newValue) async {
                              setState(() {
                                radioListTileValue1 = !newValue!;
                                radioListTileValue2 = !newValue;
                                radioListTileValue3 = !newValue;

                                radioListTileValue4 = newValue;
                              });
                            },
                            title: Text(
                              '250 points' /* 250 points */,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                            subtitle: Text(
                              '\$185' /* $185 */,
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                            tileColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryColor,
                            checkColor:
                                FlutterFlowTheme.of(context).primaryBtnText,
                            dense: false,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                child: FFButtonWidget(
                  onPressed: () {
                    Navigator.pushNamed(context, '/payment');
                  },
                  text: 'Change Plan' /* Change Plan */,
                  options: FFButtonOptions(
                    width: 300,
                    height: 57,
                    color: Colors.black,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          fontSize: 24,
                        ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
