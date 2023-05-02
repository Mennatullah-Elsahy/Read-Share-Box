import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mus_app/core/flutter_flow/flutter_flow.dart';

class NewBookScreen extends StatefulWidget {
  const NewBookScreen({super.key});

  @override
  State<NewBookScreen> createState() => _NewBookScreenState();
}

class _NewBookScreenState extends State<NewBookScreen> {
  String? dropDownValue1;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  String? dropDownValue2;
  String? dropDownValue3;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    textController4?.dispose();
    textController5?.dispose();
    textController6?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 6,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    padding: const EdgeInsetsDirectional.fromSTEB(5, 3, 0, 0),
                    child: Text(
                      'Upload Up To 5 Images' /* Upload Up to 5 Images */
                      ,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Image.network(
                      'https://picsum.photos/seed/705/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Image.network(
                      'https://picsum.photos/seed/705/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Image.network(
                      'https://picsum.photos/seed/705/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Image.network(
                      'https://picsum.photos/seed/705/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                    child: Image.network(
                      'https://picsum.photos/seed/705/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textController1,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Book Name' /*  Book Name */,
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Libre Baskerville',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
              keyboardType: TextInputType.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlutterFlowDropDown(
              options: const [
                'Academics, Textbooks & Referen...',
                'Action & Adventure',
                'Arts & Music',
                'Biographies, Diaries & True Ac...',
                'Business & Economics',
                'Crime, Thriller & Mystery',
                'Computer & Technology',
                'Cooking',
                'Comics',
                'Entertainment',
                'Hobbies & Crafts',
                'Health & Fitness',
                'Home & Garden',
                'History',
                'Horror',
                'Kids & Animals',
                'Literature & Fiction',
                'Medical',
                'Politics',
                'Religion & Spiritual',
                'Sci-Fi & Fantasy',
                'Sciences & Math',
                'Sports',
                'Travel',
                'Young Adult',
              ],
              onChanged: (val) => setState(() => dropDownValue1 = val),
              width: 340,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                  ),
              hintText: 'Book Category' /* Book Category */,
              fillColor: FlutterFlowTheme.of(context).primaryBtnText,
              elevation: 2,
              borderColor: Colors.black,
              borderWidth: 5,
              borderRadius: 16,
              margin: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textController2,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Author By' /* Author By */,
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Libre Baskerville',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
              keyboardType: TextInputType.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textController3,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Page Number' /* Page Number */,
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Libre Baskerville',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textController4,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Language' /* Language */,
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Libre Baskerville',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
              keyboardType: TextInputType.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textController5,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Book Description' /*  Book Description */,
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Libre Baskerville',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
              keyboardType: TextInputType.multiline,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: textController6,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                hintText: 'Book Points' /*  Book Points */,
                hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Libre Baskerville',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x00000000),
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: FlutterFlowTheme.of(context).primaryBtnText,
                contentPadding:
                    const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
              ),
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlutterFlowDropDown(
              options: const [
                'New',
                'Barely Used',
                'Heavily Used',
              ],
              onChanged: (val) => setState(() => dropDownValue2 = val),
              width: 340,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                  ),
              hintText: 'Book Condition' /* Book Condition */,
              fillColor: FlutterFlowTheme.of(context).primaryBtnText,
              elevation: 2,
              borderColor: Colors.black,
              borderWidth: 5,
              borderRadius: 16,
              margin: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlutterFlowDropDown(
              options: const [
                'Exchange',
                'Lend',
              ],
              onChanged: (val) => setState(() => dropDownValue3 = val),
              width: 340,
              height: 50,
              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 20,
                  ),
              hintText: 'Exchange Type' /* Exchange Type */,
              fillColor: FlutterFlowTheme.of(context).primaryBtnText,
              elevation: 2,
              borderColor: Colors.black,
              borderWidth: 5,
              borderRadius: 16,
              margin: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
              hidesUnderline: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: FFButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Container(), // Change
                  ),
                );
              },
              text: 'Post' /* Post */,
              options: FFButtonOptions(
                width: 300,
                height: 57,
                color: Colors.black,
                textStyle: FlutterFlowTheme.of(context).title3.override(
                      fontFamily: 'Libre Baskerville',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      fontSize: 26,
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
        ],
      ),
    );
  }
}
