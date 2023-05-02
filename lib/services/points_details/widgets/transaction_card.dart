import 'package:flutter/material.dart';

import '../../../handlers/icon_handler.dart';
import '../../../utilities/theme/text_styles.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(width: .5, color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Buying book from store", style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      drawSvgIcon("calendar", width: 16, height: 16, iconColor: Theme.of(context).hintColor),
                      const SizedBox(width: 8),
                      Text("2021-08-12", style: Theme.of(context).textTheme.subtitle2!.copyWith(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 32,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "2000",
                      style: AppTextStyles.w400.copyWith(fontSize: 18, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
