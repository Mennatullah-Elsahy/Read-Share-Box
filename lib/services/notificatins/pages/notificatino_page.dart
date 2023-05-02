import 'package:flutter/material.dart';

import '../../../utilities/components/arrow_back.dart';
import '../../../utilities/components/custom_page_body.dart';
import '../widgets/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
        title: const Text('Notifications', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
        titleSpacing: 8,
        elevation: .2,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              NotificationCard(isViewed: false),
              NotificationCard(isViewed: true),
              NotificationCard(isViewed: false),
              NotificationCard(isViewed: true),
              NotificationCard(isViewed: false),
              NotificationCard(isViewed: true),
              NotificationCard(isViewed: false),
              NotificationCard(isViewed: true),
              NotificationCard(isViewed: false),
            ],
          ),
        ),
      ),
    );
  }
}
