import 'package:flutter/material.dart';

import '../../../routers/navigator.dart';
import '../../../utilities/components/arrow_back.dart';
import '../../../utilities/theme/media.dart';

class IndicatorHeader extends StatelessWidget {
  const IndicatorHeader({super.key, this.progress = 1, required this.totalSteps});
  final int totalSteps;
  final int progress;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              GestureDetector(onTap: () => CustomNavigator.pop(), child: const ArrowBack()),
              const SizedBox(width: 16),
              Text(
                "Book details",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Stack(
          children: [
            Container(
              height: 4,
              width: MediaHelper.width,
              color: Theme.of(context).hintColor.withOpacity(.5),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 4,
              width: MediaHelper.width * (progress / totalSteps),
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ],
    );
  }
}
