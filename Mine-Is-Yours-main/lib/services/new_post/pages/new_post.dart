import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:mus_app/components/animated_widgets.dart';
import 'package:mus_app/core/app_event.dart';
import 'package:mus_app/core/app_state.dart';
import 'package:mus_app/helpers/app_colors.dart';
import 'package:mus_app/helpers/app_text_styles.dart';
import 'package:mus_app/helpers/media_query_helper.dart';
import 'package:mus_app/routes/routes.dart';
import 'package:mus_app/services/home/blocs/category_bloc.dart';
import 'package:mus_app/services/new_post/blocs/custom_model_sheet.dart';
import 'package:mus_app/services/new_post/blocs/new_post_bloc.dart';

import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_widgets.dart';
import '../widgets/custom_btn.dart';
import '../widgets/form_drop_down_button.dart';
import '../widgets/custom_text_field.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  String lang = "";
  String category = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewPostBloc,AppState>(
        builder: (context,state) {
          return SafeArea(
            child: Container(
              width: MediaQueryHelper.width,
              height: MediaQueryHelper.height,
              color: state is Loading? Colors.white.withOpacity(.2):Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: !(state is Loading)? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   SizedBox(height: 24,),
                InkWell(
                  child: Icon(Icons.arrow_back),
                  onTap: () {
                    RouterGenerator.pop();
                  },
                ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: '',
                            options: FFButtonOptions(
                                width: 12,
                                height: 80,
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Libre Baskerville',
                                      color: Colors.white,
                                    ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 16),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                'New Book' /* New Book */
                                ,
                                style: FlutterFlowTheme.of(context).title2.override(
                                      fontFamily: 'Libre Baskerville',
                                      color: const Color(0xFF2D3436),
                                      fontSize: 40,
                                      fontWeight: FontWeight.w800,
                                    ),
                              ),
                            ),
                          ),
                          Lottie.asset(
                            'assets/lottie_animations/lf30_editor_vvsomwbh.json',
                            fit: BoxFit.cover,
                            animate: true,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListAnimator(
                        key: Key("testing"),
                        data: [
                          StreamBuilder<String?>(
                              stream: NewPostBloc.instance.bookNameStream,
                              builder: (context, snapshot) {
                                return CustomTextField(hint: 'Book Title', onChange: NewPostBloc.instance.updateBookName, hasError: snapshot.hasError, initText: NewPostBloc.instance.bookName.valueOrNull);
                              }),
                          BlocBuilder<CategoryBlock,AppState>(
          
                            builder: (context,state){
                             if(state is Done){
                               return StreamBuilder<CustomModelSheet?>(
                                  stream: NewPostBloc.instance.bookCategoryStream,
                                  builder: (context, snapshot) {
                                    return FormSelector(
                                      data: List.generate(state.data!.length, (index)=>CustomModelSheet(name: state.data![index].name)),
                                      label: 'Select Book Category',
                                      onTap: NewPostBloc.instance.updateBookCategory,
                                      value: NewPostBloc.instance.bookCategory.valueOrNull,
                                    );
                                  });
                             }
                             else if(state is Loading){
                              return CircularProgressIndicator();
                             }
                             else{
                              return SizedBox();
                             }
                            }
                          ),
                          StreamBuilder<String?>(
                              stream: NewPostBloc.instance.authorStream,
                              builder: (context, snapshot) {
                                return CustomTextField(hint: 'Author Name', onChange: NewPostBloc.instance.updateAuthor, hasError: snapshot.hasError, initText: NewPostBloc.instance.author.valueOrNull);
                              }),
                          StreamBuilder<String?>(
                              stream: NewPostBloc.instance.pageNumber,
                              builder: (context, snapshot) {
                                return CustomTextField(hint: 'Page Number', onChange: NewPostBloc.instance.updatePageNumber, hasError: snapshot.hasError, initText: NewPostBloc.instance.pageNumber.valueOrNull);
                              }),
                          // for lang
                          StreamBuilder<CustomModelSheet?>(
                            stream: NewPostBloc.instance.languageStream,
                            builder: (context, snapshot) {
                              return FormSelector(
                                data: [CustomModelSheet(name: "English", value: "English"), CustomModelSheet(name: "Arabic", value: "Arabic")],
                                label: 'Select Lang',
                                onTap: NewPostBloc.instance.updateLanguage,
                                value: NewPostBloc.instance.language.valueOrNull,
                              );
                            }
                          ),
                           StreamBuilder<CustomModelSheet?>(
                            stream: NewPostBloc.instance.bookStateStream,
                            builder: (context, snapshot) {
                              return FormSelector(
                                data: [CustomModelSheet(name: "New", value: "New"), CustomModelSheet(name: "Barely Used", value: "Barely Used"),CustomModelSheet(name: "Heavily Used", value: "Heavily Used")],
                                label: 'Book Condition',
                                onTap: NewPostBloc.instance.updateBookState,
                                value: NewPostBloc.instance.bookstate.valueOrNull,
                              );
                            }
                          ),
                          StreamBuilder<String?>(
                              stream: NewPostBloc.instance.bookNameStream,
                              builder: (context, snapshot) {
                                return CustomTextField(hint: 'Book Describtion', onChange: NewPostBloc.instance.updateBookDescribtion, hasError: snapshot.hasError, initText: NewPostBloc.instance.bookDescribtion.valueOrNull);
                              }),
                          StreamBuilder<String?>(
                              stream: NewPostBloc.instance.bookNameStream,
                              builder: (context, snapshot) {
                                return CustomTextField(hint: 'Book Points', onChange: NewPostBloc.instance.updateBookPoints, hasError: snapshot.hasError, initText: NewPostBloc.instance.bookPoints.valueOrNull);
                              }),
                          // CustomTextField(hint: 'Author Name', onChange: (value) {log(value);},),
                        ],
                      ),
                    ),
                    CustomBtn(text: "Submit",onTap: (){NewPostBloc.instance.add(Add());}),
                    const SizedBox(height: 24,)
                  ],
                ) : Center(child: CircularProgressIndicator(),),
              ),
            ),
          );
        }
      ),
    );
  }
}

