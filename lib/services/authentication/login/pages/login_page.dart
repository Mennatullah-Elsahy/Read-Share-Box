import 'package:flutter/material.dart';

import '../../../../base/widgets/fields/text_input_field.dart';
import '../../../../utilities/components/custom_btn.dart';
import '../../../../utilities/components/custom_page_body.dart';
import '../../../../utilities/theme/text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
              const TextInputField(labelText: "Email", hintText: "Enter the email"),
              const TextInputField(labelText: "Password", hintText: "Enter the password", withBottomPadding: false),
              Text(
                "Forget password?",
                style: AppTextStyles.w300.copyWith(color: Theme.of(context).colorScheme.secondary, fontSize: 16),
              ),
              const SizedBox(height: 24),
              const CustomBtn(height: 56, radius: 10, text: "Login"),
            ],
          ),
        ),
      ),
    );
  }
}
