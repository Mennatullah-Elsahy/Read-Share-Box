import 'package:flutter/material.dart';

import '../../../utilities/theme/text_styles.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.isViewed,
  });
  final bool isViewed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: isViewed ? Colors.white : Theme.of(context).colorScheme.primaryContainer,
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage("https://picsum.photos/200/300"),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: AppTextStyles.w600.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 4),
                Expanded(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: AppTextStyles.w400.copyWith(fontSize: 12, color: Theme.of(context).hintColor),
                  ),
                ),
                Text(
                  "Wenesday, 08, 02:00Am",
                  style: AppTextStyles.w400.copyWith(fontSize: 12, color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
