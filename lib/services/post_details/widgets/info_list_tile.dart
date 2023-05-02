import 'package:flutter/material.dart';

import '../../../handlers/icon_handler.dart';

class InfoListTile extends StatelessWidget {
  const InfoListTile({
    super.key,
    required this.label,
    required this.icon,
  });
  final String icon, label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        drawSvgIcon(icon, width: 16, height: 16, iconColor: Theme.of(context).hintColor),
        const SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.bodyText2!),
      ],
    );
  }
}
