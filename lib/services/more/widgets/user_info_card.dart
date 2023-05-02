import 'package:flutter/material.dart';

import '../../../utilities/theme/text_styles.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage("https://picsum.photos/200/300"),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: AppTextStyles.w600.copyWith(fontSize: 22),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "john.doe@gmail.com",
                      style: AppTextStyles.w500.copyWith(fontSize: 18, color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 24, color: Colors.grey),
        ],
      ),
    );
  }
}
