import 'package:flutter/material.dart';

import '../../../handlers/icon_handler.dart';
import '../../../utilities/theme/text_styles.dart';

class MoreOption extends StatelessWidget {
  const MoreOption({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.isLogout = false,
  });
  final Function() onTap;
  final String icon, title;
  final bool isLogout;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      leading: drawSvgIcon(icon, iconColor: isLogout ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.primary),
      minLeadingWidth: 16,
      title: Text(
        title,
        style: AppTextStyles.w500.copyWith(fontSize: 16, color: isLogout ? Theme.of(context).colorScheme.error : Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
