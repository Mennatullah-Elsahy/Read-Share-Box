import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mus_app/services/registration/bloc/register_bloc.dart';

import '../../../components/animated_widgets.dart';
import '../../../components/custom_icon.dart';
import '../../../core/app_event.dart';
import '../../../core/app_state.dart';
import '../../../core/flutter_flow/flutter_flow_theme.dart';
import '../../../core/flutter_flow/flutter_flow_widgets.dart';
import '../../../core/validator.dart';
import '../../../helpers/app_colors.dart';
import '../../../helpers/app_text_styles.dart';
import '../../../helpers/media_query_helper.dart';
import '../../../routes/routes.dart';
import '../../new_post/widgets/custom_btn.dart';
import '../../new_post/widgets/custom_text_field.dart';
import '../bloc/login_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = false, showConfirmPassword = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQueryHelper.width,
          height: MediaQueryHelper.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                      InkWell(
                        child: Icon(Icons.arrow_back),
                        onTap: () {
                          RouterGenerator.pop();
                        },
                      ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(4, 24, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      
                      Align(
                        alignment: const AlignmentDirectional(-0.15, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: '',
                            options: FFButtonOptions(
                                width: 12,
                                height: 75,
                                color: Colors.black,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Libre Baskerville',
                                      color: Colors.white,
                                    ),
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 16),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          child: Text(
                            'Welcome Back.. ',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Libre Baskerville',
                                  color: const Color(0xFF2D3436),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                        ),
                      ),
                      Lottie.asset(
                        'assets/lottie_animations/lf30_editor_k8ghji64.json',
                        width: 150,
                        height: 130,
                        fit: BoxFit.cover,
                        animate: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: Form(
                    key: key,
                    child: ListAnimator(
                      data: [
                        StreamBuilder<String?>(
                            stream: RegisterBloc.instance.nameStream,
                            builder: (context, snapshot) {
                              return CustomTextField(
                                hint: "Your Name",
                                onChange: RegisterBloc.instance.updateName,
                                type: TextInputType.text,
                                onValidate: (v) {
                                  if (NameValidator.nameValidator(
                                          v as String) !=
                                      null) {
                                    RegisterBloc.instance.name.addError(
                                      NameValidator.nameValidator(v)!,
                                    );
                                  }
                                },
                                hasError: snapshot.hasError,
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: StreamBuilder<String?>(
                            stream: RegisterBloc.instance.emailStream,
                            builder: (context, snapshot) {
                              return CustomTextField(
                                hint: "email",
                                onChange: RegisterBloc.instance.updateEmail,
                                type: TextInputType.emailAddress,
                                onValidate: (v) {
                                  if (EmailValidator.emailValidator(
                                          v as String) !=
                                      null) {
                                    RegisterBloc.instance.email.addError(
                                      EmailValidator.emailValidator(v)!,
                                    );
                                  }
                                },
                                hasError: snapshot.hasError,
                              );
                            },
                          ),
                        ),
                        StreamBuilder<String?>(
                            stream: RegisterBloc.instance.passwordStream,
                            builder: (context, snapshot) {
                              return CustomTextField(
                                hint: "password",
                                onChange: RegisterBloc.instance.updatePassword,
                                type: TextInputType.visiblePassword,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: InkWell(
                                    onTap: () => setState(
                                        () => showPassword = !showPassword),
                                    child: customImageIconSVG(
                                      color: showPassword ? Colors.black : null,
                                      imageName: showPassword ? 'show' : 'hide',
                                    ),
                                  ),
                                ),
                                hide: showPassword,
                                onValidate: (v) {
                                  if (PasswordValidator.passwordValidator(
                                          v as String) !=
                                      null) {
                                    RegisterBloc.instance.password.addError(
                                      PasswordValidator.passwordValidator(v)!,
                                    );
                                  }
                                },
                                hasError: snapshot.hasError,
                              );
                            }),
                        const SizedBox(height: 18),
                        StreamBuilder<String?>(
                            stream: RegisterBloc.instance.confirmPasswordStream,
                            builder: (context, snapshot) {
                              return CustomTextField(
                                hint: "confirm_password",
                                onChange:
                                    RegisterBloc.instance.updateConfirmPassword,
                                type: TextInputType.visiblePassword,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: InkWell(
                                    onTap: () => setState(() =>
                                        showConfirmPassword =
                                            !showConfirmPassword),
                                    child: customImageIconSVG(
                                      color: showConfirmPassword
                                          ? Colors.black
                                          : null,
                                      imageName:
                                          showConfirmPassword ? 'show' : 'hide',
                                    ),
                                  ),
                                ),
                                hide: showConfirmPassword,
                                onValidate: (v) {
                                  if (PasswordConfirmationValidator
                                          .passwordValidator(
                                              v,
                                              RegisterBloc.instance.password
                                                  .valueOrNull) !=
                                      null) {
                                    RegisterBloc.instance.confirmPassword
                                        .addError(
                                      PasswordConfirmationValidator
                                          .passwordValidator(
                                              v,
                                              RegisterBloc.instance.password
                                                  .valueOrNull)!,
                                    );
                                  }
                                },
                                hasError: snapshot.hasError,
                              );
                            }),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<RegisterBloc, AppState>(builder: (context, state) {
                  return StreamBuilder<bool?>(
                      stream: RegisterBloc.instance.submitStream,
                      builder: (context, snapshot) {
                        return CustomBtn(
                          key: Key("btn"),
                          text: "Login",
                          onTap: () {
                            log("${key.currentState!.validate()}  ${snapshot.data}");
                            if (snapshot.hasData) {
                              if (snapshot.data!) {
                                RegisterBloc.instance.add(Click());
                              }
                            }
                          },
                          btnHeight: 55,
                          txtColor: Colors.white,
                          color: Colors.black,
                          radius: 15,
                          withPadding: false,
                          loading: state is Loading,
                        );
                      });
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Text("or",
                          style: AppTextStyles.w400.copyWith(
                              fontSize: 24, color: AppColor.SUB_HEADER)),
                      SizedBox(width: 8),
                      const Expanded(
                          child: Divider(
                        height: 0,
                        color: AppColor.SUB_HEADER,
                      )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text("Have an account? ",
                        style: AppTextStyles.w400.copyWith(
                            fontSize: 14, color: AppColor.SUB_HEADER)),
                    InkWell(
                      onTap: ()=>RouterGenerator.pop(),
                      child: Text("Sign In",
                          style: AppTextStyles.w600
                              .copyWith(fontSize: 18, color: Colors.black)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
