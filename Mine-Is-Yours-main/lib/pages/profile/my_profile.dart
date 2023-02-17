import 'package:mus_app/core/flutter_flow/flutter_flow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../books/book_details.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  double? ratingBarValue1;
  double? ratingBarValue2;
  double? ratingBarValue3;
  File? _photo;

  showBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Please Choose Image",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.photo_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "From Gallery",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  onTap: () async {
                    var picked = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (picked != null) {
                      setState(() {
                        _photo = File(picked.path);
                      });
                    }
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).maybePop();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.camera,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "From Camera",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  onTap: () async {
                    var picked = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (picked != null) {
                      setState(() {
                        _photo = File(picked.path);
                      });
                    }
                    Navigator.of(context).maybePop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          'My profile' /* My profile */,
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
        child: Container(
          width: double.infinity,
          color: FlutterFlowTheme.of(context).primaryBtnText,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                height: MediaQuery.of(context).size.height * .4,
                child: Image.network(
                  'https://picsum.photos/seed/999/600',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                      child: Text(
                        'User Name' /* User Name */,
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Libre Baskerville',
                              color: Colors.black,
                              fontSize: 18,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                      child: Text(
                        'user123@gmail.com' /* user123@gmail.com */,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Libre Baskerville',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                      child: Text(
                        '+2010101010101' /* +2010101010101 */,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Libre Baskerville',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ),
                    RatingBar.builder(
                      onRatingUpdate: (newValue) =>
                          setState(() => ratingBarValue1 = newValue),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFDF00),
                      ),
                      direction: Axis.horizontal,
                      initialRating: ratingBarValue1 ??= 3,
                      unratedColor: FlutterFlowTheme.of(context).lineColor,
                      itemCount: 5,
                      itemSize: 30,
                      glowColor: const Color(0xFFFFDF00),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          showBottomSheet();
                        },
                        text: 'Edit' /* Edit */,
                        options: FFButtonOptions(
                          width: 136,
                          height: 40,
                          color: const Color(0xFF100000),
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Libre Baskerville',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Text(
                  'Posts :' /* Posts : */,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Libre Baskerville',
                        fontSize: 20,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookDetailsWidget(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16, 16, 8, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/images/photo_2022-10-19_20-42-53.jpg',
                              width: 130,
                              height: 140,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 2),
                              child: Text(
                                'Harry Potter' /* Harry Potter */,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Libre Baskerville',
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 2),
                              child: Text(
                                'Fantasy' /* Fantasy */,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Libre Baskerville',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                            RatingBar.builder(
                              onRatingUpdate: (newValue) =>
                                  setState(() => ratingBarValue2 = newValue),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star_rounded,
                                color: Color(0xFFFFDF00),
                              ),
                              direction: Axis.horizontal,
                              initialRating: ratingBarValue2 ??= 3,
                              unratedColor:
                                  FlutterFlowTheme.of(context).lineColor,
                              itemCount: 5,
                              itemSize: 35,
                              glowColor: const Color(0xFFFFDF00),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 16, 8, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            'assets/images/photo_2022-10-19_20-42-53.jpg',
                            width: 130,
                            height: 140,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 2),
                              child: Text(
                                'Harry Potter' /* Harry Potter */,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Libre Baskerville',
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 2),
                              child: Text(
                                'Fantasy' /* Fantasy */,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Libre Baskerville',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              ),
                            ),
                            RatingBar.builder(
                              onRatingUpdate: (newValue) =>
                                  setState(() => ratingBarValue3 = newValue),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star_rounded,
                                color: Color(0xFFFFDF00),
                              ),
                              direction: Axis.horizontal,
                              initialRating: ratingBarValue3 ??= 3,
                              unratedColor:
                                  FlutterFlowTheme.of(context).lineColor,
                              itemCount: 5,
                              itemSize: 35,
                              glowColor: const Color(0xFFFFDF00),
                            ),
                          ],
                        ),
                      ),
                    ],
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
