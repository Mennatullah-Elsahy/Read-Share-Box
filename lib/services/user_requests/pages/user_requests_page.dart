import 'package:flutter/material.dart';

import '../../../utilities/components/arrow_back.dart';
import '../../../utilities/components/custom_page_body.dart';
import '../widgets/user_request_card.dart';

class UserRequestsPage extends StatelessWidget {
  const UserRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPageBody(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
            child: ArrowBack(),
          ),
        ),
        title: const Text('Recived Requests', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
        titleSpacing: 8,
        elevation: .2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 24),
              ...List.generate(
                5,
                (index) => UserRequestCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
