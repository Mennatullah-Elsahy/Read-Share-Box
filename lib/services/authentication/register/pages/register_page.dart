import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/widgets/fields/date_input_field.dart';
import '../../../../base/widgets/fields/text_input_field.dart';
import '../../../../utilities/components/custom_btn.dart';
import '../../../../utilities/components/custom_page_body.dart';
import '../blocs/register_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RegisterCubit>(context);
    return CustomPageBody(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Placeholder(
                      strokeWidth: 1,
                      fallbackHeight: 200,
                      fallbackWidth: 200,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextInputField(labelText: "Name", hintText: "Enter the name", controller: bloc.name),
                  TextInputField(labelText: "Email", hintText: "Enter the email", controller: bloc.email, keyboardType: TextInputType.emailAddress),
                  TextInputField(labelText: "Phone", hintText: "Enter the phone", controller: bloc.phone, keyboardType: TextInputType.phone),
                  DateInputField(
                    labelText: "Date of birth",
                    hintText: "Enter the date of birth",
                    initialValue: bloc.dateOfBirth,
                    onChange: (value) => bloc.dateOfBirth = value,
                  ),
                  TextInputField(labelText: "Password", hintText: "Enter the password", keyboardType: TextInputType.visiblePassword, controller: bloc.password),
                  TextInputField(labelText: "Confirmation Password", hintText: "Enter the confirmation password", withBottomPadding: false, keyboardType: TextInputType.visiblePassword, controller: bloc.confirmPassword),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: CustomBtn(
                      height: 56,
                      radius: 10,
                      text: "Login",
                      onTap: () => bloc.register(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
